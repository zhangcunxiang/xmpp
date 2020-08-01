%%memo start%%

-xml(topic_user_item,
    #elem{name= <<"topic_user_item">>,
        xmlns= <<"jabber:iq:topic">>,
        module= 'memo_xep_topic',
        result = {topic_user_item,'$user','$server','$nick','$addtime'},
        attrs = [#attr{name= <<"user">> ,required=false},
            #attr{name= <<"server">> ,required=false},
            #attr{name= <<"nick">> ,required=false},
            #attr{name= <<"addtime">> ,required=false}]}).

-xml(query_topic_info,
    #elem{name= <<"query_topic_info">>,
        xmlns= <<"jabber:iq:topic">>,
        module= 'memo_xep_topic',
        result = {query_topic_info ,'$tid','$tname','$tcreater',
        '$tcreate_time','$topic_type','$user_item','$tmaxnum'},
        attrs = [#attr{name = <<"tid">>,required= true},
                #attr{name = <<"tname">>,required= false},
                #attr{name = <<"tcreater">>,required= false,
                dec = {jid, decode, []},
                enc = {jid, encode, []}},
                #attr{name = <<"tcreate_time">>,required= false},
                #attr{name = <<"topic_type">>,required= false},
                #attr{name = <<"tmaxnum">>,required= false}],
        refs = [#ref{name = topic_user_item ,label = '$user_item'}]
    }).

-xml(mod_topic,
    #elem{name= <<"query">>,
        xmlns= <<"jabber:iq:topic">>,
        module = 'memo_xep_topic',
        result = {mod_topic,'$rtype','$code','$tuser','$topic_info','$user_topic_list'},
        attrs = [#attr{name = <<"rtype">>,required= false},
                #attr{name= <<"code">>,required=false},
                #attr{name = <<"tuser">>,required = false }],
        refs = [#ref{name= query_topic_info,min = 0, max = 1,label = '$topic_info'},
                #ref{name = query_topic_info,label='$user_topic_list'}
                ]
                 }).


-xml(mod_gateway,
    #elem { name = <<"query">>,
        xmlns = <<"jabber:iq:memo:gateway">>,
        module = 'memo_xep_gateway',
        result = { mod_gateway, '$device_id', '$device_type', '$device_name', '$property' },
        attrs = [
            #attr{ name = <<"device_id">>, required = true },
            #attr{ name = <<"device_type">>, required = false },
            #attr{ name = <<"device_name">>, required = false },
            #attr{ name = <<"property">>, required = false }]
          }).


-xml(group_user_item,
     #elem{name = <<"group_user_item">>,
        xmlns= <<"jabber:memo:group">>,
        module = 'memo_xep_group',
        result = {group_user_item,'$user','$server','$nick','$role'},
        attrs = [#attr{name = <<"user">>,required= false},
                #attr{name = <<"server">>,required = false},
                #attr{name = <<"nick">>,required = false},
                #attr{name = <<"role">> ,required = false}]
        }).

-xml(query_group_info,
    #elem{name = <<"query_group_info">>,
        xmlns= <<"jabber:memo:group">>,
        module = 'memo_xep_group',
        result = {query_group_info, '$otype','$targetuser','$gid','$gname','$group_type','$maxuser','$gcreater','$user_items'},
        attrs = [#attr{name = <<"otype">>,required = false},
                #attr{name = <<"targetuser">> ,required = false},
                #attr{name = <<"gid">> ,required = false},
                #attr{name = <<"gname">> ,required = false},
                #attr{name = <<"group_type">> ,required = false},
                #attr{name = <<"maxuser">> ,required = false},
                #attr{name = <<"gcreater">> ,required = false,
                dec = {jid, decode, []},
                enc = {jid, encode, []}}],
        refs = [ #ref{name = group_user_item ,label = '$user_items'}]
        }).



-xml(memo_group,
    #elem{name = <<"query">>,
        xmlns= <<"jabber:memo:group">>,
        module = 'memo_xep_group',
        result = { memo_group, '$rtype','$group_info','$group_type'},
        attrs = [#attr{name = <<"rtype">>,required = false},
        #attr{name = <<"group_type">>,required = false}],
        refs = [ #ref{name = query_group_info, min = 0, max = 1,label = '$group_info'}]
        }).



-xml(group_item,
    #elem{name= <<"group_item">>,
        xmlns= <<"jabber:memo:group:relation">>,
        module = 'memo_xep_group_relation',
        result = {group_item, '$gid','$gname','$group_type','$gcreater','$role','$photo','$maxuser'},
        attrs = [#attr{name = <<"gid">> ,required = true},
                 #attr{name = <<"gname">> ,required = true},
                 #attr{name = <<"group_type">> ,required = false},
                 #attr{name = <<"maxuser">> ,required = false},
                 #attr{name = <<"role">> ,required = false},
                 #attr{name = <<"photo">> ,required = false},
                 #attr{name = <<"gcreater">> ,required = false,
                                 dec = {jid, decode, []},
                                 enc = {jid, encode, []}}]
                                 }).

-xml(group_relation_request,
    #elem{ name= <<"request_info">>,
        xmlns= <<"jabber:memo:group:relation">>,
        module = 'memo_xep_group_relation',
        result = { request_info, '$sub_type','$ask_msg',
                '$join_user','$invite_user','$out_user','$invited_user'},
        attrs = [ #attr{name = <<"sub_type">>,required = false},
                #attr{name = <<"ask_msg">>,required = false},
                #attr{name = <<"join_user">>,required = false},
                #attr{name = <<"invite_user">>,required = false},
                #attr{name = <<"out_user">>,required = false},
                #attr{name = <<"invited_user">>,required = false}]
        }).


-xml(memo_group_relation,
    #elem{name = <<"query">>,
        xmlns= <<"jabber:memo:group:relation">>,
        module = 'memo_xep_group_relation',
        result = { memo_group_relation, '$rtype','$gid','$request_info','$group_items'},
        attrs = [#attr{name = <<"rtype">>,required = false},
                #attr{name = <<"gid">>,required = false}],
        refs = [ #ref{name = group_item,label = '$group_items'},
        #ref{name = group_relation_request,min = 0, max = 1,label = '$request_info'}]
        }).



-xml(chat_info,
    #elem{name = <<"chat_info">>,
        xmlns = <<"jabber:memo:message">>,
        module = 'memo_xep_message',
        result = { chat_info,'$type','$dispatched','$content_type','$target_id',
        '$target_name','$send_user','$max_user','$now_user', '$data_type' },
        attrs = [ #attr{name = <<"type">>,
                            required=true,
                                  enc = {enc_enum, []},
                                  dec = {dec_enum, [[oto,topic,group,gateway]]} },
                  #attr{name = <<"dispatched">> ,required = false},
                 #attr{name = <<"target_id">>,required = false},
                #attr{name = <<"content_type">> ,required = false},
                #attr{name = <<"data_type">> ,required = false},
                #attr{name = <<"target_name">> ,required = false},
                #attr{name = <<"send_user">>,required=false},
                #attr{name = <<"max_user">> ,required = false},
                #attr{name = <<"now_user">> ,required = false}]
        }).

-xml(auth_info,
    #elem{name= <<"auth_info">>,
        xmlns = <<"jabber:memo:message">>,
        module = 'memo_xep_message',
        result = { auth_info, '$type','$sub_type','$info_id','$info_name','$auth_msg',
        '$otype','$need_resend','$operate_user','$target_user','$nick'},
        attrs = [ #attr{name = <<"type">>, required=true,
                        enc = {enc_enum, []},
                        dec = {dec_enum, [[groupauth,sgroupauth,topicauth]]} },
                  #attr{name= <<"sub_type">>,required = false},
                  #attr{name= <<"info_id">>,required = false},
                  #attr{name= <<"info_name">>,required = false},
                  #attr{name = <<"auth_msg">>,required = false},
                  #attr{name = <<"otype">>,required = false},
                  #attr{name = <<"need_resend">>,required = false},
                  #attr{name = <<"operate_user">>,required = false},
                  #attr{name = <<"target_user">>,required = false},
                  #attr{name = <<"nick">>,required = true }]
         }).

-xml(receipt_info,
    #elem{name = <<"receipt_info">>,
        xmlns= <<"jabber:memo:message">>,
        module = 'memo_xep_message',
        result = {receipt_info, '$type','$msgid','$topic_name','$topic_id','$max_user','$now_user'},
        attrs = [ #attr{name = <<"type">>, required = true },
                 #attr{name = <<"msgid">>,required = false},
                 #attr{name = <<"topic_name">>,required = false},
                 #attr{name = <<"topic_id">>,required = false},
                 #attr{name = <<"max_user">>,required = false},
                 #attr{name = <<"now_user">>,required = false}]
        }).

-xml(sub_device,
    #elem{ name = <<"sub_device">>, xmlns = <<"jabber:memo:message">>,
    module = 'memo_xep_message',
    result = { sub_device, '$device_id', '$device_name', '$device_type' },
    attrs = [ #attr{ name = <<"device_id">>, required = true },
        #attr{ name = <<"device_name">>, required = false },
        #attr{ name = <<"device_type">>, required = false }]
        }).

-xml(gateway_subdevice,
    #elem{ name = <<"gateway_info">>,
        xmlns = <<"jabber:memo:message">>,
        module = 'memo_xep_message',
        result = { gateway_subdevice, '$gateway_id', '$gateway_name', '$sub_device' },
        attrs = [ #attr{ name = <<"gateway_id">>, required = true },
            #attr{ name = <<"gateway_name">>, required = false }],
        refs = [#ref{name = sub_device, max = 1, min = 0, label = '$sub_device'}]
            }).

-xml(memo_info,
    #elem{name = <<"memo_info">>,
        xmlns= <<"jabber:memo:message">>,
        module = 'memo_xep_message',
        result = {memo_info,'$memo_type','$chat_info','$auth_info','$receipt_info','$scene_info', '$gateway_subdevice'},
        attrs = [ #attr{name = <<"memo_type">>,
                            required = true,
                            enc = {enc_enum, []},
                            dec = {dec_enum, [[chat,auth,receipt,track,share,in_out, gateway]] }}],
        refs = [#ref{name = chat_info ,max=1,min =0,label = '$chat_info'},
            #ref{name = auth_info ,max = 1,min = 0, label = '$auth_info'},
            #ref{name = receipt_info ,max = 1,min = 0, label = '$receipt_info'},
            #ref{name = memo_scene,max=1,min=0 ,label = '$scene_info'},
            #ref{name = gateway_subdevice, max = 1, min = 0, label = '$gateway_subdevice'}
        ]
        }).


-xml(memo_delay_msg,
    #elem{name = <<"memo_delay_msg">>,
        xmlns= <<"jabber:memo:delay">>,
        module = 'memo_delay_msg',
        result = {memo_delay_msg,'$msg_id','$packet','$send_time',
        '$delay_seconds','$time_ref','$state' },
         attrs = [
          #attr{name = <<"msg_id">>,required = false },
         #attr{name = <<"packet">>,required = false },
            #attr{name = <<"send_time">>,required = false },
             #attr{name = <<"delay_seconds">> },
             #attr{name = <<"time_ref">>,required = false},
              #attr{name = <<"state">>,required = false} ]
              }).


-xml(search_user_item,
    #elem{name = <<"user_item">>,
        xmlns= <<"jabber:memo:search">>,
        module = 'memo_xep_search',
        result = {search_user_item,'$jid','$nick','$photo'},
        attrs = [ #attr{name = <<"jid">>,required=false ,
                              dec = {jid, decode, []},
                              enc = {jid, encode, []} },
                  #attr{name = <<"nick">>,required= false},
                  #attr{name = <<"photo">>,required =false}]
                  }).

-xml(search_group_item,
    #elem{name = <<"group_item">>,
        xmlns= <<"jabber:memo:search">>,
        module = 'memo_xep_search',
        result = {search_group_item,'$gid','$gname','$gphoto','$gtype'},
        attrs = [ #attr{name = <<"gid">>,required=false},
                  #attr{name = <<"gname">>,required= false},
                  #attr{name = <<"gphoto">>,required =false},
                  #attr{name = <<"gtype">>,required =false}]
                  }).

-xml(search_account,
    #elem{name = <<"account">>,
        xmlns= <<"jabber:memo:search">>,
        module = 'memo_xep_search',
        result = '$cdata',
        cdata = #cdata{required = true, label = '$cdata'}
        }).


-xml(memo_search,
    #elem{name = <<"query">>,
        xmlns= <<"jabber:memo:search">>,
        module = 'memo_xep_search',
        result = {memo_search,'$rtype','$keywords','$user_items','$group_items','$search_account'},
        attrs = [ #attr{name = <<"rtype">>,required=false},
        #attr{name = <<"keywords">>,required=false}],
        refs = [#ref{name = search_user_item,label= '$user_items'},
            #ref{name = search_group_item,label= '$group_items'},
            #ref{name = search_account,max=1,min=0,label = '$search_account'}]
            }).

-xml(group_vcard_BINVAL,
     #elem{name = <<"BINVAL">>,
           xmlns = <<"group-vcard-temp">>,
	   module = 'memo_group_vcard',
           cdata = #cdata{required = true,label='$cdata'},
           result = '$cdata'}).

-xml(group_vcard_GROUP_NAME,
     #elem{name = <<"GROUP_NAME">>,
           xmlns = <<"group-vcard-temp">>,
	   module = 'memo_group_vcard',
           cdata = #cdata{required = true, label = '$cdata'},
           result = '$cdata'}).

-xml(group_vcard_TYPE,
     #elem{name = <<"TYPE">>,
           xmlns = <<"group-vcard-temp">>,
	   module = 'memo_group_vcard',
           cdata = #cdata{required = true, label = '$cdata'},
           result = '$cdata'}).

-xml(group_vcard_PHOTO,
    #elem{name = <<"PHOTO">>,
        xmlns= <<"group-vcard-temp">>,
        module = 'memo_group_vcard',
        result = {group_vcard_photo,'$type','$photo'},
        refs = [ #ref{name = group_vcard_BINVAL, label='$photo',max=1,min=0},
                #ref{name = group_vcard_TYPE,label ='$type',max=1,min=0}]
                }).

-xml(group_vcard_PHOTO_URL,
    #elem{name = <<"URL">>,xmlns= <<"group-vcard-temp">>,
    module = 'memo_group_vcard',
    result = '$cdata' }).

-xml(memo_group_vcard,
    #elem{name = <<"vCard">>,
        xmlns= <<"group-vcard-temp">>,
        module = 'memo_group_vcard',
        result = {memo_group_vcard,'$gid','$photo_version','$group_name','$photo','$photo_url' },
        attrs = [#attr{name = <<"gid">>,required= false},
            #attr{name= <<"photo_version">>,default= <<"">> }],
        refs = [ #ref{name = group_vcard_GROUP_NAME, label='$group_name',min=0,max=1},
            #ref{name = group_vcard_PHOTO,label = '$photo',min=0,max=1},
            #ref{name = group_vcard_PHOTO_URL,label='$photo_url',min=0,max=1 } ]
            }).


-xml(memo_check_account,
    #elem{name = <<"query">>,
        xmlns= <<"memo:check:account">>,
        module = 'memo_check_account',
        result = {memo_check_account,'$account','$server','$exist'},
        attrs = [#attr{name = <<"account">>,required= false},
                #attr{name = <<"server">>,required= false},
                #attr{name = <<"exist">>,required= false}]
                }).

-xml(memo_change_pass,
    #elem{name = <<"query">>,
        xmlns= <<"memo:change:pass">>,
        module= 'memo_change_pass',
        result = {memo_change_pass,'$account','$newpass','$vcode'},
        attrs = [#attr{name = <<"account">>,required= false},
            #attr{name = <<"newpass">>,required= false},
            #attr{name = <<"vcode">>,required= false}]
            }).

-xml(memo_invite_info,
    #elem{name= <<"query">>,
        xmlns= <<"memo:invite:info">>,
        module= 'memo_invite_info',
        result = {memo_invite_info,'$beinviteds','$invite_num','$success_num'},
        attrs = [#attr{name = <<"beinviteds">>,required= false},
            #attr{name = <<"invite_num">>,required= false},
            #attr{name = <<"success_num">>,required= false} ]
            }).

-xml(memo_device_info,
    #elem{name = <<"query">>,
        xmlns = <<"jabber:memo:device">>,
        module = 'memo_xep_device',
        result = {memo_device_info,'$user','$server','$device_type','$token','$language','$device_number','$domain_key','$is_debug'},
        attrs = [#attr{name = <<"user">>,required= false},
            #attr{name = <<"server">>,required= false},
            #attr{name = <<"device_type">>,required= false},
            #attr{name = <<"token">>,required= false},
            #attr{name = <<"language">>,required= false},
            #attr{name = <<"domain_key">>,required=false},
            #attr{name = <<"is_debug">>,required=false},
            #attr{name = <<"device_number">>,required= false} ]
         }).

-xml(memo_jingle,
    #elem{name = <<"signaling">>,
    xmlns= <<"jabber:client">>,
    module = 'memo_xep_jingle',
     result = {memo_jingle } } ).

-xml(position,
    #elem{name = <<"position">>,
    xmlns = <<"jabber:memo:scene">>,
    module = 'memo_xep_scene',
    result = { position, '$x','$y','$z' },
    attrs = [ #attr{name = <<"x">>,required=false},
    #attr{name = <<"y">>,required=false},
    #attr{name = <<"z">>,required=false} ]} ).

-xml(size,
    #elem{name = <<"size">>,
    xmlns = <<"jabber:memo:scene">>,
    module = 'memo_xep_scene',
    result = { size, '$l','$w','$h'},
    attrs = [ #attr{name = <<"l">>,required=false},
    #attr{name = <<"w">>,required=false},
    #attr{name = <<"h">>,required=false} ]} ).


-xml(trans_form,
    #elem{name = <<"trans_form">>,xmlns = <<"jabber:memo:scene">>,
    module = 'memo_xep_scene',
    result = { trans_form, '$position','$size'},
    refs = [ #ref{ name= position,label = '$position',min=0,max=1},
    #ref{ name = size,label = '$size',min=0,max=1}] }).

-xml(material_profile,
    #elem{name = <<"profile">>,xmlns= <<"jabber:memo:scene">>,
    module = 'memo_xep_scene',
    result = { profile, '$trans_form','$mac_address','$type','$name','$scene_id','$message'},
    refs = [ #ref{name = trans_form, label = '$trans_form',max=1,min=0 } ],
    attrs = [ #attr{name = <<"mac_address">>,required = false},
    #attr{name = <<"type">>,required = false},
    #attr{name = <<"message">>,required = false},
    #attr{name = <<"scene_id">> ,required = false},
    #attr{name = <<"name">>,required = false} ] }).

-xml(memo_scene,
    #elem{name = <<"query">>,xmlns= <<"jabber:memo:scene">>,
        module = 'memo_xep_scene',
        result = { memo_scene, '$profiles','$name','$rtype','$role','$type',
        '$height','$width','$length','$scene_id','$share_user','$creator'},
        refs = [ #ref{name = material_profile, label = '$profiles'}],
        attrs = [ #attr{name = <<"name">>,required = false},
        #attr{name = <<"rtype">>,required = false},
        #attr{name = <<"type">>,required = false},
        #attr{name = <<"role">>,required = false},
        #attr{name = <<"height">>,required = false},
        #attr{name = <<"width">>,required = false},
        #attr{name = <<"length">>,required = false},
        #attr{name = <<"share_user">>,required = false},
        #attr{name = <<"creator">>,required=false},
        #attr{name = <<"scene_id">>,required = false} ]
         }).

-xml(memo_scene_list,
    #elem{name = <<"query">>,xmlns= <<"jabber:memo:scene:list">>,
            module = 'memo_xep_scene_list',
            result = { memo_scene_list ,'$role' ,'$memo_scene'},
            attrs = [ #attr{name = <<"role">>,required = false } ],
            refs = [ #ref{name = memo_scene, label = '$memo_scene'} ]
            }).

-xml(memo_send_sms,
    #elem{name = <<"query">>,xmlns= <<"jabber:memo:send:sms">>,
        module = 'memo_xep_send_sms',
        result = { memo_send_sms,'$country_code','$phone_number','$lang' },
        attrs = [ #attr{name = <<"country_code">>,required= true},
        #attr{name = <<"phone_number">>,required = true},
         #attr{name = <<"lang">>,required = false }]
        }).

-xml(memo_check_sms_login_code,
    #elem{name = <<"query">>,xmlns= <<"jabber:memo:check:sms:login:code">>,
    module = 'memo_xep_check_sms_login_code',
    result = { memo_check_sms_login_code,'$user','$host','$code','$pass'},
    attrs = [
    #attr{name = <<"user">>,required = false},
    #attr{name = <<"host">>,required = false},
    #attr{name = <<"code">>,required = true},
    #attr{ name = <<"pass">>,required = false}]
    }).


-xml(memo_owncloud,
    #elem{ name = <<"query">>,xmlns= <<"jabber:memo:owncloud">>,
    module = 'memo_xep_owncloud',
    result = { memo_owncloud,'$rtype','$watching_user','$watching_server'},
    attrs = [
    #attr{name = <<"rtype">>,required = false },
    #attr{name = <<"watching_user">>,required = false},
    #attr{name = <<"watching_server">>,required = false}
    ]}).


%%memo end%%
