package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.BookmarkEntity;

/**
 * Repository : Bookmark.
 */
public interface BookmarkJpaRepository extends PagingAndSortingRepository<BookmarkEntity, Integer> {
	@Query(
			"Select u From BookmarkEntity u "
			)
	Page<BookmarkEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From BookmarkEntity u where u.user.id=?1 and u.episode.id=?2 and u.isDelete=0"
			)
	List<BookmarkEntity> findBy_UserId_EpisodeId(Integer userId, Integer episodeId);
	
	@Query(
			"Select u From BookmarkEntity u where u.user.id=?1  and u.isDelete=0"
			)
	List<BookmarkEntity> findBy_UserId(Integer userId);
	
	@Modifying
	@Query(
			value="Update bookmark set IS_DELETE=1 where USER_ID=?1",nativeQuery = true
			)
	void deleteBy_UserId(Integer userid);
	
//	@Modifying
//	@Query(
//			value="Update bookmark set IS_DELETE=1 where _id=?1",nativeQuery = true
//			)
//	void delete(Integer userid);
}
