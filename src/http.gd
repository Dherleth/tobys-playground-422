extends Node

@onready var request_input = $RequestZone/Input
@onready var response_result_field = $ResponseZone/ResponseResult/Result
@onready var response_code_field = $ResponseZone/ResponseCode/Code
@onready var response_headers_field = $ResponseZone/ResponseHeaders/Headers
@onready var response_body_field = $ResponseZone/ResponseBody/Body
@onready var loading_label = $RequestZone/Loading


func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)

	

func _on_request_completed(result: int, response_code : int, headers: PackedStringArray, body: PackedByteArray):
	loading_label.hide()
	response_result_field.text = str(result) + " - " + result_to_text(result)
	response_code_field.text = str(response_code)
	response_headers_field.text = JSON.stringify(headers, "\t")
	response_body_field.text = JSON.stringify(JSON.parse_string(body.get_string_from_utf8()), "\t")


func _on_send_button_pressed():
	var shock_history_for_survey = {
		"1": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"2": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"3": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"4": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"5": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"6": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"7": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"8": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		},
		"9": {
			"shock_title": {
				"key" : "title_key",
				"text" : "some text",
			},
			"shock_effect": {
				"key": "title_key",
				"text": "some_text"
			},
			"player_reactions": {
				"chosen_reaction": 0,
				"1": "some text",
				"2": "some text",
				"3": "some text"
			},
			"empty_entry": {}
		}
	}
		
	
	var url = "https://sure.euler.usi.ch/json.php?mth=upd2"
	var data_to_send = {
		"res_id": "999",
		"res_name": "Playground",
		"res_txt": shock_history_for_survey
	}
	
	var json = JSON.stringify(data_to_send)
	var headers = ["Content-Type: application/json"]
	print(json)
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)


func empty_fields():
	response_result_field.text = ""
	response_code_field.text = ""
	response_headers_field.text = ""
	response_body_field.text = ""


func _on_git_hub_button_pressed():
	request_input.text = "https://api.github.com/repos/godotengine/godot/releases/latest"


func _on_api_get_button_pressed():
	request_input.text = "https://sure.euler.usi.ch/json.php?mth=ctx2&res_id=1&yr=2023"
	
	
func _on_api_get_upsert_pressed():
	request_input.text = "https://sure.euler.usi.ch/json.php?mth=ups&res_id=1&prm_id=186&yr=2023&tj=8000"


func result_to_text(result: int):
	match result:
		0:
			return "RESULT_SUCCESS : Request successful"
		1: 
			return "RESULT_CHUNKED_BODY_SIZE_MISMATCH"
		2:
			return "RESULT_CANT_CONNECT : Request failed while connecting."
		3:
			return "RESULT_CANT_RESOLVE : Request failed while resolving."
		4:
			return "RESULT_CONNECTION_ERROR : Request failed due to connection (read/write) error."
		5:
			return "RESULT_TLS_HANDSHAKE_ERROR : Request failed on TLS handshake."
		6:
			return "RESULT_NO_RESPONSE : Request does not have a response (yet)."
		7:
			return "RESULT_BODY_SIZE_LIMIT_EXCEEDED : Request exceeded its maximum size limit, see body_size_limit."
		8:
			return "RESULT_BODY_DECOMPRESS_FAILED"
		9:
			return "RESULT_REQUEST_FAILED : Request failed (currently unused)."
		10:
			return "RESULT_DOWNLOAD_FILE_CANT_OPEN : HTTPRequest couldn't open the download file."
		11:
			return "RESULT_DOWNLOAD_FILE_WRITE_ERROR : HTTPRequest couldn't write to the download file."
		12:
			return "RESULT_REDIRECT_LIMIT_REACHED : Request reached its maximum redirect limit, see max_redirects."
		13:
			return "RESULT_TIMEOUT : Request failed due to a timeout. If you expect requests to take a long time, try increasing the value of timeout or setting it to 0.0 to remove the timeout completely."
