package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.LikeHistoryEntity;

/**
 * Repository : LikeHistory.
 */
public interface LikeHistoryJpaRepository extends PagingAndSortingRepository<LikeHistoryEntity, Integer> {
	@Query(
			"Select u From LikeHistoryEntity u "
			)
	Page<LikeHistoryEntity> listPaging(Pageable pageable);
	@Query(
			"Select u From LikeHistoryEntity u where u.userId=?1 and u.episodeId=?2 and u.type=?3 "
			)
	List<LikeHistoryEntity> findBy_UserId_EpisodeId(Integer userId, Integer episodeId, Integer type);
}
