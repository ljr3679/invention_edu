package cms.cmmn;

import javax.annotation.Resource;

import cms.cmmn.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

public abstract class CommonServiceImpl extends EgovAbstractServiceImpl {
	
	@Resource(name="commonMapper")
	protected CommonMapper commonMapper;

}
