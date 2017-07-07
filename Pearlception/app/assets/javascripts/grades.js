$().ready(function(){
	console.log("Ready")
	document.getElementById('grade-form').onsubmit = function(){
		var form_elements = getGradeFormElements()
		if(elementsAreEmpty(form_elements)){
			alert("There is an empty field")
			return false
		}
		if(!shortNameIsValid(form_elements.Short_name)){
			alert("Short name must only contain alphanumeric characters and be <= 5 characters")
			return false
		}
		if(!measurementsAreNumbers(form_elements)){
			alert("An entered width,height,or length is not valid.(must be of form 1,1.1,0.1)")
			return false
		}
		return true
	}
})

function getGradeFormElements(){
	var form = document.getElementById('grade-form')
	return {
		Full_name: form["grade[Full_name]"].value,
		Short_name: form["grade[Short_name]"].value,
		Width_max: form["grade[Width_max]"].value,
		Width_min: form["grade[Width_min]"].value,
		Height_max: form["grade[Height_max]"].value,
		Height_min: form["grade[Height_min]"].value,
		Length_max: form["grade[Length_max]"].value,
		Length_min: form["grade[Length_min]"].value
	}
}

function elementsAreEmpty(elements){
	for(key in elements){
		if(elements[key] == ""){
			return true
		}
	}
	return false
}

function shortNameIsValid(shortName){
	var shortNameRegexp = new RegExp(/[a-zA-Z0-9]{1,5}/)
	if(shortName.match(shortNameRegexp) == null || shortName.length > 5){
		return false
	}
	return true
}

function measurementsAreNumbers(elements){
	var regexp = new RegExp(/[0-9]+(\.[0-9]+){0,1}/)
	if(elements.Height_max.match(regexp) == null || elements.Height_min.match(regexp) == null){
		return false
	}
	if(elements.Width_max.match(regexp) == null || elements.Width_min.match(regexp) == null){
		return false
	}
	if(elements.Length_max.match(regexp) == null || elements.Length_min.match(regexp) == null){
		return false
	}
	return true
}

$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})