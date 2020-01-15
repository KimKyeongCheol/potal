package egovframework.let.uss.mpe.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.uss.mpe.service.IndvdlPgeVO;


/*IndvdlPge.selectIndvdlPgeList*/
@Repository("EgovIndvdlPgeDAO")
public class EgovIndvdlPgeDAO extends EgovComAbstractDAO {

	public List<?> selectIndvdlPgeList(IndvdlPgeVO searchVO) {
		return list("selectIndvdlPgeList", searchVO);
	}

	public int selectIndvdlPgeListCnt(IndvdlPgeVO searchVO) {
		return (Integer) select("selectIndvdlPgeListCnt", searchVO);
	}

	public IndvdlPgeVO selectIndvdlPgeDetail(IndvdlPgeVO indvdlPgeVO) {
		return (IndvdlPgeVO) select("selectIndvdlPgeDetail", indvdlPgeVO);
	}

	public void insertIndvdlPge(IndvdlPgeVO indvdlPgeVO) {
		insert("insertIndvdlPge", indvdlPgeVO);
	}

	public void updateIndvdlPge(IndvdlPgeVO indvdlPgeVO) {
		update("updateIndvdlPge", indvdlPgeVO);
	}

}
