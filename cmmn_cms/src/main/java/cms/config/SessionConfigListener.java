package cms.config;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionConfigListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent evt) {
		// TODO Auto-generated method stub
		//System.out.println("Created : "+evt);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent evt) {
		// TODO Auto-generated method stub
		//System.out.println("Destroyed : "+evt);
	}

}
