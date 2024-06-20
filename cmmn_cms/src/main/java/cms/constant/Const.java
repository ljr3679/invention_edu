package cms.constant;

public interface Const {
	
	/** PROPERTIES */
	public static final String LOGGER_LEVEL = "gbls.logger.level";
	public static final String USR_MAX_PARENT = "gbls.usr.max.parnet";
	public static final String USR_MAX_DEPTH = "gbls.usr.max.depth";
	public static final String ADM_MAX_PARENT = "gbls.adm.max.parnet";
	public static final String ADM_MAX_DEPTH = "gbls.adm.max.depth";
	public static final String ATTACH_EXT = "gbls.attach.ext";
	public static final String IMAGE_EXT = "gbls.image.ext";
	
	/** SESSION */
	public static final String USER_SESSION_SET = "front.user.set";
	public static final String USER_MENU_SET = "front.user.menu.set";
	public static final String ADMIN_SESSION_SET = "cms.admin.set";
	public static final Long ADMIN_SESSION_TIME = (long) (60 * 30 * 1000);
	
	/** FILE */
	public static final String EDITOR_DIRECTORY = "editor";
	public static final String ATTACH_DIRECTORY = "attach";
	
	/** ACTION JSP HANDLER */
	public static final String ACTION_HANDLER = "cms/handler/action";
	public static final String LINK_HANDER = "cms/handler/link";
	public static final String ERROR_HANDER = "cms/handler/error";
	public static final String EMPTY_HANDER = "cms/handler/empty";
	
	/** CHARACTER SET */
	public static final String CHARSET = "UTF-8";
	
	/** PRIFIX SET */
	public static final String SITE_PREFIX = "/WEB-INF/jsp/";
	public static final String ADMIN_CMS_PREFIX = "cms/site/";
	public static final String ADMIN_PREFIX = "web/admin/";
	public static final String USER_PREFIX = "web/user/";
	
	/** SEPERATOR */
	public static final String SITE_SEPERATOR = "[-sep-]";
	public static final String SITE_SPLITOR = "\\[-sep-\\]";
	
	/** API KEY */
	public static final String WHO_IS_ID = "smstest";
	public static final String WHO_IS_PW = "smstest";
	public static final String SMTP_EMAIL_HOST = "smtp.gmail.com";
	public static final String SMTP_EMAIL_PORT = "465";
	public static final String SMTP_EMAIL_USERNAME = "polox940@gmail.com";
	public static final String SMTP_EMAIL_PASSWORD = "ivdsphpfkzbieycg";
	public static final String SMTP_EMAIL_AUTH = "true";
	public static final String SMTP_EMAIL_TIMEOUT = "5000";
	public static final String SMTP_EMAIL_STARTTLS = "true";
	public static final String MESSAGEME_API_KEY = "GXI5CJC5V5R0805";
	
	public static final String NICE_SITE_CODE = "gbls.nice.code";
	public static final String NICE_SITE_PASS = "gbls.nice.pass";
	public static final String BIZSIREN_MOBILE_ID = "gbls.bizsiren.mobile.id";
	public static final String BIZSIREN_MOBILE_PW = "gbls.bizsiren.mobile.pw";
	public static final String BIZSIREN_MOBILE_SRVNO = "gbls.bizsiren.mobile.srvno";
	
	/** SYSTEM MESSAGE */
	public static final String ACCESS_DENIED_MSG = "비정상적 접근입니다.";
	/** SYSTEM MESSAGE */
	
}