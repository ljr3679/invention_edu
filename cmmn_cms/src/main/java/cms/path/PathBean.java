package cms.path;

import org.springframework.core.io.Resource;

public class PathBean {
	
	private Resource classpathRoot;
	private Resource contextRoot;
	
	public Resource getClasspathRoot() {
		return classpathRoot;
	}
	
	public void setClasspathRoot(Resource classpathRoot) {
		this.classpathRoot = classpathRoot;
	}
	
	public Resource getContextRoot() {
		return contextRoot;
	}
	
	public void setContextRoot(Resource contextRoot) {
		this.contextRoot = contextRoot;
	}
	
}
