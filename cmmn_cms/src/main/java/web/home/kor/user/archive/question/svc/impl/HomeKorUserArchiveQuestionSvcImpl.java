package web.home.kor.user.archive.question.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.archive.question.svc.HomeKorUserArchiveQuestionSvc;

@Service("homeKorUserArchiveQuestionSvc")
public class HomeKorUserArchiveQuestionSvcImpl extends CommonServiceImpl implements HomeKorUserArchiveQuestionSvc{
	@Override
	public void insertHomeKorUserArchiveQuestion(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserArchiveQuestion_SQL.insertHomeKorUserArchiveQuestion", vo);
	}
}