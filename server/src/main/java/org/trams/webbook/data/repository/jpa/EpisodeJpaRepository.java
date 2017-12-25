package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.EpisodeEntity;

/**
 * Repository : Episode.
 */
public interface EpisodeJpaRepository extends PagingAndSortingRepository<EpisodeEntity, Integer> {
	@Query(
			"Select u From EpisodeEntity u where u.isDelete!=1"
			)
	Page<EpisodeEntity> listPaging(Pageable pageable);
	
	@Query(
			value="Select count(*) From episode c where c.IS_DELETE!=1 ",nativeQuery = true
			)
	Integer totalEpisode();
	
	@Query(
			value="Select count(*) From episode c where c.IS_DELETE!=1 and (SELECT DATEDIFF(CURDATE(),c.CREATE_DATE) AS DiffDate) <=7",nativeQuery = true
			)
	Integer totalNewEpisode();
	
	@Query(
			value="Select sum(c.HITS_NO) From episode c where c.IS_DELETE!=1",nativeQuery = true
			)
	Integer totalSumHitNumber();
	
	@Query(
			value="Select count(*) From episode c where c.IS_SHOW =1 where c.IS_DELETE!=1",nativeQuery = true
			)
	Integer totalEpisodeCharge();
	
	@Query(
			value="Select count(*) From coupon_used where IS_DELETE!=1",nativeQuery = true
			)
	Integer totalEpisodePurchase();
	
	@Query(
			value="Select count(*) From coupon_used c where c.IS_DELETE!=1 and (SELECT DATEDIFF(CURDATE(),c.CREATE_DATE) AS DiffDate) <=7",nativeQuery = true
			)
	Integer totalNewEpisodePurchase();
	
	@Query(
			"Select u From EpisodeEntity u where u.isDelete!=1 and u.book.id=?1 and temporarySave=0"
			)
	Page<EpisodeEntity> listPagingByBookId(Integer id,Pageable pageable);
	
	@Query(
			"Select u From EpisodeEntity u where u.isDelete!=1 and u.book.id=?1 and temporarySave=1"
			)
	Page<EpisodeEntity> listPagingByBookId_Temporary_Save(Integer id,Pageable pageable);
	
	@Query(
			"Select u From EpisodeEntity u where u.isDelete!=1 and u.temporarySave=0 and u.episodeNumber=?1 and u.book.id=?2"
			)
	List<EpisodeEntity> findByEpisodeNumber(Integer id,Integer bookId);
	
	@Modifying
	@Query(
			value="Update episode set EPISODE_NUMBER=EPISODE_NUMBER-1 where book_id=?1 and EPISODE_NUMBER>?2",nativeQuery = true
			)
	 void updateAferDelete_EpisodeNumber(Integer book_id ,Integer number);
	
	@Query(
			value="Select count(c._id) From episode c where c.IS_DELETE!=1 and c.BOOK_ID=?1 and c.TEMPORARY_SAVE=0",nativeQuery = true
			)
	 Integer totalEpisode_ByBookId(Integer book_id);
	
	@Modifying
	@Query(
			value="Update episode set IS_DELETE=1 where _id=?1",nativeQuery = true
			)
	 void delete(Integer id);
	
	@Query(
			value="Select count(c._id) From episode c where c.IS_DELETE!=1 and c.COMPLETE=1 and c.BOOK_ID=?1",nativeQuery = true
			)
	Integer totalEpisodeComplete(Integer bookid);
	
	@Query(
			value="Select sum(c.VIEW_NO) From episode c where c.IS_DELETE=0 and  c.BOOK_ID=?1",nativeQuery = true
			)
	Integer totalEpisode_ViewNo_ByBookId(Integer bookid);
	
	@Query(
			value="Select sum(c.RECOMMONDATION_NO) From episode c where c.IS_DELETE=0 and  c.BOOK_ID=?1",nativeQuery = true
			)
	Integer totalEpisode_RecomentNo_ByBookId(Integer bookid);

	
	
}
