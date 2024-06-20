package cms.config;

import org.apache.commons.dbcp2.BasicDataSource;

public class CustomDataSource extends BasicDataSource {
	
	public CustomDataSource(
			String dbms,
			
			String mysqlDriver, 
			String mysqlUrl, 
			String mysqlUsername, 
			String mysqlPassword, 
			
			String oracleDriver, 
			String oracleUrl, 
			String oracleUsername,
			String oraclePassword,
			
			String mssqlDriver, 
			String mssqlUrl,
			String mssqlUsername,
			String mssqlPassword,
			
			String postgresqlDriver,
			String postgresqlUrl,
			String postgresqlUsername,
			String postgresqlPassword) {
		
		switch (dbms) {
			case "mysql":
				setDriverClassName(mysqlDriver);
				setUrl(mysqlUrl);
				setUsername(mysqlUsername);
				setPassword(mysqlPassword);
				setValidationQuery("SELECT 1");
				break;
			case "oracle":
				setDriverClassName(oracleDriver);
				setUrl(oracleUrl);
				setUsername(oracleUsername);
				setPassword(oraclePassword);
				setValidationQuery("SELECT 1 FROM DUAL");
				break;
			case "mssql":
				setDriverClassName(mssqlDriver);
				setUrl(mssqlUrl);
				setUsername(mssqlUsername);
				setPassword(mssqlPassword);
				setValidationQuery("SELECT 1");
				break;
			case "postgresql":
				setDriverClassName(postgresqlDriver);
				setUrl(postgresqlUrl);
				setUsername(postgresqlUsername);
				setPassword(postgresqlPassword);
				setValidationQuery("SELECT 1");
				break;
			default:
				break;
		}
	}

}
