<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title>Webslesson Tutorial | JSON - Dynamic Dependent Dropdown List using Jquery and Ajax</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 </head>
 <body>
  <br /><br />
  <div class="container" style="width:600px;">
   <h2 align="center">JSON - Dynamic Dependent Dropdown List using Jquery and Ajax</h2><br /><br />
   <select name="country" id="country" class="form-control input-lg">
    <option value="">Select country</option>
   </select>
   <br />
   <select name="state" id="state" class="form-control input-lg">
    <option value="">Select state</option>
   </select>
   <br />
   <select name="city" id="city" class="form-control input-lg">
    <option value="">Select city</option>
   </select>
  </div>
 </body>
</html>

<script>
$(document).ready(function(){
	  var countryOptions = '';
	  var stateOptions = '';
	  var cityOptions = '';

	  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/City.json', function(data){
	    countryOptions += '<option value="">Select country</option>';
	    $.each(data, function(key, country){
	      countryOptions += '<option value="'+country.id+'">'+country.name+'</option>';
	    });
	    $('#country').html(countryOptions);
	  });

	  $(document).on('change', '#country', function(){
	   
	    var country_id = $(this).val();
	    if(country_id != '')
	    {
	      $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/District.json', function(data){
	        stateOptions += '<option value="">Select state</option>';
	        $.each(data, function(key, state){
	          if(country_id == state.country_id)
	          {
	            stateOptions += '<option value="'+state.id+'">'+state.name+'</option>';
	          }
	        });
	        $('#state').html(stateOptions);
	      });
	    }
	    else
	    {
	       $('#state').html('<option value="">Select state</option>');
	       $('#city').html('<option value="">Select city</option>');
	    }
	  });
	  
	  $(document).on('change', '#state', function(){
	    var state_id = $(this).val();
	    if(state_id != '')
	    {
	      $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/Ward.json', function(data){
	        cityOptions += '<option value="">Select city</option>';
	        $.each(data, function(key, city){
	          if(state_id == city.state_id)
	          {
	            cityOptions += '<option value="'+city.id+'">'+city.name+'</option>';
	          }
	        });
	        $('#city').html(cityOptions);
	      });
	    }
	    else
	    {
	       $('#city').html('<option value="">Select city</option>');
	    }
	  });
	});
</script>