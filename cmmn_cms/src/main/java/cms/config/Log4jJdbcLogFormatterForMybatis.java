package cms.config;

import net.sf.log4jdbc.Slf4jSpyLogDelegator;
import net.sf.log4jdbc.Spy;
import net.sf.log4jdbc.tools.LoggingType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <PRE>
 *  쿼리문 로그 이쁘게 찍기 
 * </PRE>
 *
 * @author    김태호
 * @version   1.0, 2015. 11. 19.
 * @see       참조하는 자원을 기술
 */
public class Log4jJdbcLogFormatterForMybatis extends Slf4jSpyLogDelegator {

    private static final Logger LOGGER = LoggerFactory.getLogger(Log4jJdbcLogFormatterForMybatis.class);
    
    private LoggingType loggingType = LoggingType.DISABLED;
    private String margin       = "";
    private String sqlPrefix    = "================= SQL Query Start =====================";

    public int getMargin() {
        return margin.length();
    }

    public void setMargin(int n) {
        margin = String.format("%1$#" + n + "s", "");
    }

    public Log4jJdbcLogFormatterForMybatis() {
    }

    
    @Override
    public String sqlOccured(Spy spy, String methodCall, String rawSql) {
    	
    	// 쿼리를 트림하고, 여러개의 공백은 하나로 변경합니다. 
    	rawSql = rawSql.trim(); 
    	rawSql = rawSql.replaceAll("\\s+", " ");
    	String changedSql = rawSql;
    	
    	StringBuffer changedSqlSb = new StringBuffer();
    	
        if (loggingType == LoggingType.DISABLED) {
            return "";
        }

        // Remove all existing cr lf, unless MULTI_LINE
        if (loggingType != LoggingType.MULTI_LINE) {
        	changedSql = changedSql.replaceAll("\r", "");
        	changedSql = changedSql.replaceAll("\n", "");
        }
        final String fromClause = " FROM ";

        if (loggingType == LoggingType.MULTI_LINE) {
        	final String whereClause = " WHERE "; 
        	final String andClause = " AND "; 
        	final String orderByClause = " ORDER BY "; 
        	final String groupByClause = " GROUP BY ";
            final String subSelectClauseS = "\\(SELECT";
            final String subSelectClauseR = " (SELECT";
            changedSql = changedSql.replaceAll(fromClause, "\n\t\t\t" + margin + fromClause);
            changedSql = changedSql.replaceAll(whereClause, "\n\t\t\t" + margin + whereClause);
            changedSql = changedSql.replaceAll(andClause, "\n\t\t\t" + margin + andClause);
            changedSql = changedSql.replaceAll(subSelectClauseS, "\n" + margin + subSelectClauseR);
            changedSql = changedSql.replaceAll(orderByClause, "\n\t\t\t" + margin + orderByClause);
            changedSql = changedSql.replaceAll(groupByClause, "\n\t\t\t" + margin + groupByClause);
            
        }
        if (loggingType == LoggingType.SINGLE_LINE_TWO_COLUMNS && changedSql.startsWith("select")) {
        	
            String from = changedSql.substring(changedSql.indexOf(fromClause) + fromClause.length());
            //changedSql = from + "\t" + changedSql;
            changedSqlSb.append(from);
            changedSqlSb.append("\t");
            changedSqlSb.append(changedSql);
        }
        
        LOGGER.info("::::::::::::::::::: SQL Query START :::::::::::::::::::::::::::::::");
        LOGGER.info("\n\t\t {} ", changedSql);
        LOGGER.info("::::::::::::::::::: SQL Query END :::::::::::::::::::::::::::::::");
        //return changedSql;
        return changedSqlSb.toString();
    }

    @Override
    public String sqlOccured(Spy spy, String methodCall, String[] sqls) {
        String s = "";
    	StringBuffer sb = new StringBuffer();
        for (int i = 0; i < sqls.length; i++) {
            s += sqlOccured(spy, methodCall, sqls[i]) + String.format("%n");
        	sb.append(sqlOccured(spy, methodCall, sqls[i]));
        	sb.append(String.format("%n"));
        }
        return s;
    }

    public LoggingType getLoggingType() {
        return loggingType;
    }

    public void setLoggingType(LoggingType loggingType) {
        this.loggingType = loggingType;
    }

    public String getSqlPrefix() {
        return sqlPrefix;
    }

    public void setSqlPrefix(String sqlPrefix)
    {
        this.sqlPrefix = sqlPrefix;
    }
}
