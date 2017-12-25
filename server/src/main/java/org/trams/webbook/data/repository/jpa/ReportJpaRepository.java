package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CommentEntity;
import org.trams.webbook.bean.jpa.PostEntity;
import org.trams.webbook.bean.jpa.ReportEntity;

/**
 * Repository : Report.
 */
public interface ReportJpaRepository extends PagingAndSortingRepository<ReportEntity, Integer> {
	@Query(
			"Select u From ReportEntity u "
			)
	Page<ReportEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From ReportEntity u where u.typeKey like ?1 and u.isDelete=0"
			)
	Page<ReportEntity> listPagingBy_Type(String type,Pageable pageable);
	
	@Query(
			"Select u From ReportEntity u where u.user.id = ?1 and u.parentId = ?2 and u.typeKey = ?3 and u.isDelete=0"
			)
	ReportEntity findByUserParrentType(Integer userid, Integer parrent, String tpye);
	
	@Query(
			"Select u From PostEntity u where u.reportNumber > 0 and u.isDelete = 0"
			)
	Page<PostEntity> listPostReport(Pageable pageable);
	
	@Query(
			"Select u From CommentEntity u where u.reportNumber > 0 and u.isDelete = 0"
			)
	Page<CommentEntity> listCommentReport(Pageable pageable);
	
	@Query(
			"Select u From ReportEntity u where u.parentId = ?1 and u.typeKey=?2  and u.isDelete = 0"
			)
	List<ReportEntity> listPopupHistory(Integer id,String type);
	
	
}
