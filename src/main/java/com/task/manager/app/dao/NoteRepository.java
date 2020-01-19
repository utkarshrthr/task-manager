package com.task.manager.app.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.task.manager.app.model.Note;

public interface NoteRepository extends JpaRepository<Note, Long> {
 	
	List<Note> findByTitle(String title);

	// SELECT * FROM notes WHERE title LIKE '%in%';
	List<Note> findByTitleContaining(String title);
	/*List<Note> findByTitleContains(String title);
	List<Note> findByTitleIsContaining(String title);*/ // all three method will work same 
	
	//List<Note> findByTitleContainingIgnoreCase(String title); // same query but case-insensitive
	
	//List<Note> findByTitleLike(String title); // this will be called as -> noteRepository.findByTitleLike("%in%");

	// SELECT * FROM notes WHERE title LIKE '%in';
	List<Note> findByTitleStartsWith(String rating);

	// SELECT * FROM notes WHERE title LIKE 'in%';
	List<Note> findByTitleEndsWith(String director);
	
	@Modifying
	@Query("UPDATE Note n SET n.title = :title, n.content = :content, n.tags = :tags WHERE n.id = :id")
	void updateNote(@Param("title") String title, @Param("content") String content, @Param("tags") Set<String> tags, @Param("id") Long id);
}
