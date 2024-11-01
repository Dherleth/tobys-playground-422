GDPC                                                                                       	   P   res://.godot/exported/133200997/export-9574ce2964d4a0a1d4c8ed63b7717325-node.scn        �      �'VOc�onk��    ,   res://.godot/global_script_class_cache.cfg  p)             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex             ：Qt�E�cO���       res://.godot/uid_cache.bin  P-      @       US������bk�*       res://icon.svg  �)      �      k����X3Y���f       res://icon.svg.import   @(      �       �	�4>��DB��       res://project.binary�-            �\��eС��?Vz�%       res://scenes/node.tscn.remap )      a       �>�uގ���wġ,	       res://src/http.gd   �      5      �!�ií�8*!���                 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://src/http.gd ��������      local://PackedScene_c4eqw 	         PackedScene          	         names "   1      Node    script    HTTPRequest    Title 	   position    Node2D    Title1    offset_left    offset_right    offset_bottom    text    Label    Title2    offset_top    RequestZone    FillButtonsZone    GitHubButton    metadata/_edit_use_anchors_    Button    ApiGetButton    ApiGetUpsertButton    Input '   theme_override_colors/background_color 
   wrap_mode 	   TextEdit    SendButton    Loading    visible !   theme_override_colors/font_color    ResponseZone    ResponseResult 
   ColorRect    color    Result    focus_mode &   theme_override_colors/selection_color    selection_enabled    RichTextLabel    ResponseCode    Code    ResponseHeaders    Headers    ResponseBody    Body    _on_git_hub_button_pressed    pressed    _on_api_get_button_pressed    _on_api_get_upsert_pressed    _on_send_button_pressed    	   variants    A             
     �D  �A      �     C     �A      Toby's Playground
      4B     �A     C     8B      Godot 4.2.2 
     D  �B
     �   �     �B      B      GitHub            �B     C      API GET       C     hC      API GET UPSERT      �      D     �B   �%h>�%h>�%h>  �?   ?   https://api.github.com/repos/godotengine/godot/releases/latest            "D     PD      Send             D      �    �D     �   ,
4�w3?/��5  �?      loading 
     �B  HC     �B     pA   	   Response 
          B     �B      Godot result code    �� >�� >�� >  �?     �A      B     LD         ��Q?���>���>  �?
          C   
   HTTP Code    s� >s� >s� >  �?   g�Q?��>��>  �?
         `C     �B      Headers      D     �C
     VD   B      Body      2D     .D      node_count             nodes     �  ��������        ����                            ����                      ����                          ����               	      
                       ����                     	   	   
   
                     ����                          ����                          ����         	      
                             ����               	      
                             ����               	      
                             ����               	            
                             ����               	      
                       ����             !      "      #   	   $      %   
   &                     ����      '                    ����            (   	   )   
   *                    ����      +                    ����      ,   	      
   -                    ����               	          .              %   !   ����      /      0      1   	      "   2   #   3   $                    &   ����      4                    ����      ,   	      
   5                    ����               	          6              %   '   ����      /      0      1   	      "   2   #   7   $                    (   ����      8                    ����      9   	      
   :                    ����               	   ;       6              %   )   ����      /      0      1   	   <   "   2   #   3   $                    *   ����      =                    ����      0   	      
   >                    ����               	   ?       6              %   +   ����      /      0      1   	   @   "   2   #   3   $                conn_count             conns               -   ,                     -   .              	       -   /                     -   0                    node_paths              editable_instances              version             RSRC   extends Node

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
	loading_label.show()
	empty_fields()
	var request = request_input.text
	$HTTPRequest.request(request)


func empty_fields():
	response_result_field.text = ""
	response_code_field.text = ""
	response_headers_field.text = ""
	response_body_field.text = ""


func _on_git_hub_button_pressed():
	request_input.text = "https://api.github.com/repos/godotengine/godot/releases/latest"


func _on_api_get_button_pressed():
	request_input.text = "https://sure.euler.usi.ch/json.php?mth=ins&res_name=new123"
	
	
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
           GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://uu0ldqg3kb08"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 [remap]

path="res://.godot/exported/133200997/export-9574ce2964d4a0a1d4c8ed63b7717325-node.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              �=P��m�3   res://scenes/node.tscnG0r]   res://icon.svgECFG	      application/config/name         Tobys Playground   application/run/main_scene          res://scenes/node.tscn     application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  "   display/window/size/viewport_width        #   display/window/size/viewport_height      �     display/window/size/mode         #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility   