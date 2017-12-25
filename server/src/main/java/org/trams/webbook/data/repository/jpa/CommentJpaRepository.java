package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CommentEntity;

/**
 * Repository : Comment.
 */
public interface CommentJpaRepository extends PagingAndSortingRepository<CommentEntity, Integer> {
	@Query(
			"Select u From CommentEntity u "
			)
	Page<CommentEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From CommentEntity u where u.isDelete=0 and u.parentId=?1 and u.typeKey=?2 ORDER BY u.createDate DESC"
			)
	List<CommentEntity> findAllBy_ParentId_Type(Integer parentId, String typeKey);
	
	@Query(
			"Select u From CommentEntity u where u.isDelete=0 and u.parentId=?1 and u.typeKey=?2"
			)
	Page<CommentEntity> findBy_ParentId_Type(Integer parentId, String typeKey,Pageable pageable);
	
	@Query(
			"Select u From CommentEntity u where u.isDelete=0 and u.parentId=?1 and u.typeKey=?2 and u.isDelete=0"
			)
	List<CommentEntity> findAllBy_ReportId_Type(Integer reportId, String typeKey);
}
