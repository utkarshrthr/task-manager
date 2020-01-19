package com.task.manager.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.manager.app.dao.NoteRepository;
import com.task.manager.app.model.Note;

@Service("noteService")
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteRepository noteRepository;
	
	@Override
	public List<Note> getAllNotes() {
		return noteRepository.findAll();
	}

	@Override
	public List<Note> getAllNotes(String title) {
		return null;
	}

	@Override
	public List<Note> getAllNotes(String[] tags) {
		return null;
	}

	@Override
	public Note getNote(Long noteId) {
		return noteRepository.getOne(noteId);
	}

	@Override
	public Long addNote(Note note) {
		Note addedNote = noteRepository.save(note);
		return addedNote.getId();
	}

	@Override
	public void updateNote(Note note) {
		noteRepository.updateNote(note.getTitle(), note.getContent(), note.getTags(), note.getId());
	}

	@Override
	public void deleteNote(Long noteId) {
		noteRepository.deleteById(noteId);
	}
}
