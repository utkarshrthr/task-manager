<div class="modal" id="new-task-modal">
    		<div class="modal-dialog modal-dialog-centered modal-lg">
      			<div class="modal-content">
        			<div class="modal-header">
			       		<h4 class="modal-title">Create a New Note</h4>
                 		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
          				</button>
        			</div>
        			<div>
        				<div class="modal-body">
         					<div id="form">
  								<fieldset  class="scheduler-border">
	   								<div class="form-group row">
	  									<div class="col-md-1">
						       				<label for="colFormLabel" class="col-form-label-lg">Title:</label>
						       			</div>
	    								<div class="col-md-11">
	     									<input class="form-control" id="title" type="text" name="title">
	     								</div>
	    							</div>
	       							<div class="form-group row">
						       			<div class="col-md-1">
						       				<label for="colFormLabel" class="col-form-label-lg">Content :</label>
						       			</div>
	     								<div class="col-md-11">  
	      									<textarea class="form-control" id="note-content" rows="5" cols="50"></textarea>
	      								</div>
	    							</div>
	     							<div class="form-group row">
	      								<div class="col-md-1">
						       				<label for="colFormLabel" class="col-form-label-lg">Tags:</label>
						       			</div>
	    								<div class="col-md-11">
	     									<input class="form-control" id="tags" type="text" name="tags" data-role="tagsinput">
	     								</div>
	   								</div>
  								</fieldset>
  							</div>
       	 				</div>
        				<div class="modal-footer">
         					<button class="btn btn-danger btn-task" id="close-note-btn" data-dismiss="modal">Cancel</button>
         					<button class="btn btn-success btn-task" id="add-note-btn" >Add</button>
	          				<input class="btn btn-warning btn-task" id="reset-note-btn" type="reset"  value="Reset" />
        				</div>
	       			</div>
      			</div>
    		</div>
  		</div>