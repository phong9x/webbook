package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CategoryEntity;

/**
 * Repository : Category.
 */
public interface CategoryJpaRepository extends PagingAndSortingRepository<CategoryEntity, Integer> {
	@Query(
			"Select u From CategoryEntity u "
			)
	Page<CategoryEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select c from CategoryEntity c where c.groupid= ?1 "
			)
	List<CategoryEntity> findByGroupId(Integer groupId);
	
	@Modifying
	@Query(
			value="Delete from category where GroupId=6 or GroupId=7 or GroupId=8 or GroupId=9 ",nativeQuery = true
			)
	 void deleteKeyword();
}
