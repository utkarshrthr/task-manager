package com.task.manager.app.service;

import java.util.List;

import com.task.manager.app.model.Note;

public interface NoteService {
	
	public List<Note> getAllNotes();
	public List<Note> getAllNotes(String title);
	public List<Note> getAllNotes(String[] tags);
	
	public Note getNote(Long noteId);
	
	public Long addNote(Note note);
	
	public void updateNote(Note note);
	
	public void deleteNote(Long noteId);
}
