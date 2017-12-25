package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.PostEntity;

/**
 * Repository : Post.
 */
public interface PostJpaRepository extends PagingAndSortingRepository<PostEntity, Integer> {
	@Query(
			"Select u From PostEntity u where u.id = ?1"
			)
	PostEntity getById(Integer id);
	
	@Query(
			"Select u From PostEntity u where u.isDelete = 0"
			)
	Page<PostEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From PostEntity u Where u.bulletinId = ?1 and u.isDelete = 0"
			)
	Page<PostEntity> findByBulletin(Integer bulletin,Pageable pageable);
	
	@Query(
			"Select u From PostEntity u Where u.bulletinId = ?1 and u.createDate >= ?2 and u.createDate <= ?3 and u.isDelete = 0"
			)
	Page<PostEntity> Top10ViewFreeboard(Integer bulletin, Date from, Date to, Pageable pageable);
	
	@Query(
			"Select u From PostEntity u Where u.bulletinName like ?1 and u.user.nickname like ?2 and u.title like ?3 and u.isDelete = 0"
			)
	Page<PostEntity> listPagingSearch(String bulletinName, String nickname, String title, Pageable pageable);
}
