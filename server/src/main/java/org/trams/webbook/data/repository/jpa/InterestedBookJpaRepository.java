package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.InterestedBookEntity;
import org.trams.webbook.bean.jpa.LikeHistoryEntity;

/**
 * Repository : InterestedBook.
 */
public interface InterestedBookJpaRepository extends PagingAndSortingRepository<InterestedBookEntity, Integer> {
	@Query(
			"Select u From InterestedBookEntity u where u.isDelete=0"
			)
	Page<InterestedBookEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From InterestedBookEntity u where u.user.id=?1 and u.isDelete=0"
			)
	List<InterestedBookEntity> findBy_UserId(Integer userId);
	
	@Modifying
	@Query(
			value="Delete from interested_book where USER_ID=?1",nativeQuery = true
			)
	void deleteBy_UserId(Integer userid);
	
	@Modifying
	@Query(
			value="Delete from interested_book where USER_ID=?1 and BOOK_ID=?2",nativeQuery = true
			)
	void deleteBy_UserId_EposoideId(Integer userid, Integer eposoideId);
	
	
	
	@Query(
			"Select u From InterestedBookEntity u where u.user.id=?1 and u.book.id=?2 and u.isDelete=0 "
			)
	List<InterestedBookEntity> findBy_UserId_BookId(Integer userId, Integer bookId);
	
	@Query(
			"Select u From InterestedBookEntity u where u.user.id=?1 and u.episodeId=?2 and u.isDelete=0 "
			)
	InterestedBookEntity findOneBy_UserId_EpisodeId(Integer userId, Integer episodeId);
	
	@Query(
			value="Select count(c._id) From interested_book c where c.IS_DELETE=0 and  c.BOOK_ID=?1",nativeQuery = true
			)
	Integer totalInterrestBook_ByBookId(Integer bookid);
}
