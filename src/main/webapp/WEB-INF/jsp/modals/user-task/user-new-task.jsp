<div class="modal" id="new-task-modal">
    		<div class="modal-dialog modal-dialog-centered modal-lg">
      			<div class="modal-content">
        			<div class="modal-header">
			       		<h4 class="modal-title">Add your task:</h4>
                 		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
          				</button>
        			</div>
        			<div>
        			  <form autocomplete="off" method="post" id="myForm">
        				<div class="modal-body">
         					<div id="form">
         					 <font color="red" id="err"></font>
  								<fieldset  class="scheduler-border">
	   								<div class="form-group row">
	  									<div class="col-md-2">
						       				<label for="colFormLabel" class="col-form-label-lg">Title :</label>
						       			</div>
	    								<div class="col-md-10">
	     									<input class="form-control" id="title" type="text" name="title">
	     								</div>
	    							</div>
	       							<div class="form-group row">
						       			<div class="col-md-2">
						       				<label for="colFormLabel" class="col-form-label-lg">Description :</label>
						       			</div>
	     								<div class="col-md-10">  
	      									<textarea class="form-control" id="description" rows="3" cols="50"></textarea>
	      								</div>
	    							</div>
	     							<div class="form-group row">
	       								<div class="col-md-2">
						       				<label for="colFormLabel" class="col-form-label-lg">Start On :</label>
						       			</div>
									    <div class="col-md-4">  
									    	<input class="form-control" id="starton" type="date" name="starton">
									    </div>
									    <div class="col-md-2">
						       				<label for="colFormLabel" class="col-form-label-lg">Done By :</label>
						       			</div>
									    <div class="col-md-4">  
									    	<input class="form-control" id="doneby" type="date" name="doneby">
									    </div>
	    							</div>
	     							<div class="form-group row">
	      								<div class="col-md-2">
	      									<label for="colFormLabel" class="col-form-label-lg"> Status : </label>
	      								</div>
										<div class="col-md-4">     
									     	<select disabled class="form-control" id="status"> 
									        	<option value="New">New</option> 
									            <option value="In Progress">In Progress</option>
									            <option value="Completed">Completed</option> 
									            <option value="Delayed">Delayed</option> 
									        </select> 
									  	</div>
									  	<div class="col-md-2">
						       				<label for="colFormLabel" class="col-form-label-lg">Assignee :</label>
						       			</div>
									    <div class="col-md-4">  
									    	<input class="form-control" id="assignee" type="text" name="assignee">
									    </div>
	   								</div>
  								</fieldset>
  							</div>
       	 				</div>
       	 				</form>
        				<div class="modal-footer">
         					<div style="margin-right: 50%;">
         						<button class="btn btn-danger btn-task" data-dismiss="modal">Close</button>
	          				</div>	
         					<div style="padding-right: 10px;">
	          					<input class="btn btn-warning btn-task" type="reset"  value="Reset" />
	          				</div>
	          				<div style="padding-right: 30px;">
         						<button class="btn btn-success btn-task" >Add</button>
         					</div>
        				</div>
	       			</div>
      			</div>
    		</div>
  		</div>