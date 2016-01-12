*** Settings ***
Documentation           This test goes through every file in the corpus and sees if a conversion process occurred and if only the accepted errors were passed through and if the XML files matches JATS format. This covers the FRONT corpus. This test does not clean failDetails before running, so please run allIndividualConversionTestsBODY before this test.

Resource        resources.robot

*** Test Cases ***

articles-10013-public-10013-36873-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10013-public-10013-36873-1-PB.pdf.pdf 		articles-10013-public-10013-36873PB.pdf.xml

articles-10008-public-10008-36853-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10008-public-10008-36853-1-PB.pdf.pdf		articles-10008-public-10008-36853-1-PB.pdf.xml

articles-10009-public-10009-36857PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10009-public-10009-36857-1-PB.pdf.pdf		articles-10009-public-10009-36857PB.pdf.xml

articles-10010-public-10010-36861PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10010-public-10010-36861-1-PB.pdf.pdf		articles-10010-public-10010-36861PB.pdf.xml

articles-10011-public-10011-36865PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10011-public-10011-36865-1-PB.pdf.pdf		articles-10011-public-10011-36865PB.pdf.xml


articles-10014-public-10014-36877-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10014-public-10014-36877-1-PB.pdf.pdf		articles-10014-public-10014-36877PB.pdf.xml

articles-10015-public-10015-36881PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT     articles-10015-public-10015-36881-1-PB.pdf.pdf		articles-10015-public-10015-36881PB.pdf.xml

articles-10016-public-10016-36885-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10016-public-10016-36885-1-PB.pdf.pdf		articles-10016-public-10016-36885PB.pdf.xml

articles-10017-public-10017-36889-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10017-public-10017-36889-1-PB.pdf.pdf		articles-10017-public-10017-36889PB.pdf.xml

articles-10018-public-10018-36893-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10018-public-10018-36893-1-PB.pdf.pdf		articles-10018-public-10018-36893PB.pdf.xml

articles-10229-public-10229-37907-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10229-public-10229-37907-2-PB.pdf.pdf		articles-10229-public-10229-37907-2-PB.pdf.xml

articles-10230-public-10230-40055-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10230-public-10230-40055-2-PB.pdf.pdf		articles-10230-public-10230-40055-2-PB.pdf.xml

articles-1035-public-1035-4078-4-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1035-public-1035-4078-4-PB.pdf.pdf		articles-1035-public-1035-4078-4-PB.pdf.xml

articles-1040-public-1040-4111-4-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1040-public-1040-4111-4-PB.pdf.pdf		articles-1040-public-1040-4111-4-PB.pdf.xml

articles-1049-public-1049-4124-3-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1049-public-1049-4124-3-PB.pdf.pdf		articles-1049-public-1049-4124-3-PB.pdf.xml

articles-1051-public-1051-4192-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1051-public-1051-4192-2-PB.pdf.pdf		articles-1051-public-1051-4192-2-PB.pdf.xml

articles-1052-public-1052-4577-4-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1052-public-1052-4577-4-PB.pdf.pdf		articles-1052-public-1052-4577-4-PB.pdf.xml

articles-1062-public-1062-4168-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1062-public-1062-4168-2-PB.pdf.pdf		articles-1062-public-1062-4168-2-PB.pdf.xml

articles-1065-public-1065-4169-3-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1065-public-1065-4169-3-PB.pdf.pdf		articles-1065-public-1065-4169-3-PB.pdf.xml

articles-10800-public-10800-40085-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10800-public-10800-40085-2-PB.pdf.pdf		articles-10800-public-10800-40085-2-PB.pdf.xml

articles-10815-public-10815-40348-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-10815-public-10815-40348-2-PB.pdf.pdf		articles-10815-public-10815-40348-2-PB.pdf.xml

articles-1081-public-1081-4535-4-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1081-public-1081-4535-4-PB.pdf.pdf		articles-1081-public-1081-4535-4-PB.pdf.xml

articles-1083-public-1083-4557-3-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1083-public-1083-4557-3-PB.pdf.pdf		articles-1083-public-1083-4557-3-PB.pdf.xml

articles-10935-public-10935-40355-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10935-public-10935-40355-1-PB.pdf.pdf		articles-10935-public-10935-40355-1-PB.pdf.xml

articles-10936-public-10936-40356-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-10936-public-10936-40356-1-PB.pdf.pdf		articles-10936-public-10936-40356-1-PB.pdf.xml

articles-10937-public-10937-40357-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10937-public-10937-40357-1-PB.pdf.pdf		articles-10937-public-10937-40357-1-PB.pdf.xml

articles-10938-public-10938-40358-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10938-public-10938-40358-1-PB.pdf.pdf		articles-10938-public-10938-40358-1-PB.pdf.xml

articles-10939-public-10939-40359-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10939-public-10939-40359-1-PB.pdf.pdf		articles-10939-public-10939-40359-1-PB.pdf.xml

articles-10940-public-10940-40360-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10940-public-10940-40360-1-PB.pdf.pdf		articles-10940-public-10940-40360-1-PB.pdf.xml

articles-10941-public-10941-40361-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-10941-public-10941-40361-1-PB.pdf.pdf		articles-10941-public-10941-40361-1-PB.pdf.xml

articles-10942-public-10942-40363-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10942-public-10942-40363-1-PB.pdf.pdf		articles-10942-public-10942-40363-1-PB.pdf.xml

articles-10943-public-10943-40365-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-10943-public-10943-40365-1-PB.pdf.pdf		articles-10943-public-10943-40365-1-PB.pdf.xml

articles-10944-public-10944-40366-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10944-public-10944-40366-1-PB.pdf.pdf		articles-10944-public-10944-40366-1-PB.pdf.xml

articles-10945-public-10945-40367-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10945-public-10945-40367-1-PB.pdf.pdf		articles-10945-public-10945-40367-1-PB.pdf.xml

articles-10946-public-10946-40368-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-10946-public-10946-40368-1-PB.pdf.pdf		articles-10946-public-10946-40368-1-PB.pdf.xml

articles-10947-public-10947-40369-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10947-public-10947-40369-1-PB.pdf.pdf		articles-10947-public-10947-40369-1-PB.pdf.xml

articles-10948-public-10948-40370-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10948-public-10948-40370-1-PB.pdf.pdf		articles-10948-public-10948-40370-1-PB.pdf.xml

articles-10949-public-10949-40371-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10949-public-10949-40371-1-PB.pdf.pdf		articles-10949-public-10949-40371-1-PB.pdf.xml

articles-10951-public-10951-40736-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-10951-public-10951-40736-1-PB.pdf.pdf		articles-10951-public-10951-40736-1-PB.pdf.xml

articles-11034-public-11034-42951-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11034-public-11034-42951-1-PB.pdf.pdf		articles-11034-public-11034-42951-1-PB.pdf.xml

articles-11437-public-11437-42876-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-11437-public-11437-42876-1-PB.pdf.pdf		articles-11437-public-11437-42876-1-PB.pdf.xml

articles-11507-public-11507-42519-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11507-public-11507-42519-1-PB.pdf.pdf		articles-11507-public-11507-42519-1-PB.pdf.xml

articles-11625-public-11625-44303-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11625-public-11625-44303-1-PB.pdf.pdf		articles-11625-public-11625-44303-1-PB.pdf.xml

articles-11636-public-11636-44088-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11636-public-11636-44088-1-PB.pdf.pdf		articles-11636-public-11636-44088-1-PB.pdf.xml

articles-11727-public-11727-44503-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11727-public-11727-44503-1-PB.pdf.pdf		articles-11727-public-11727-44503-1-PB.pdf.xml

articles-11888-public-11888-44862-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-11888-public-11888-44862-1-PB.pdf.pdf		articles-11888-public-11888-44862-1-PB.pdf.xml

articles-1211-public-1211-5993-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1211-public-1211-5993-2-PB.pdf.pdf		articles-1211-public-1211-5993-2-PB.pdf.xml

articles-12143-public-12143-45666-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12143-public-12143-45666-1-PB.pdf.pdf		articles-12143-public-12143-45666-1-PB.pdf.xml

articles-1214-public-1214-4656-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1214-public-1214-4656-1-PB.pdf.pdf		articles-1214-public-1214-4656PB.pdf.xml

articles-1227-public-1227-4708-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT		articles-1227-public-1227-4708-1-PB.pdf.pdf		articles-1227-public-1227-4708PB.pdf.xml

articles-1228-public-1228-4712-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-1228-public-1228-4712-1-PB.pdf.pdf		articles-1228-public-1228-4712PB.pdf.xml

articles-12480-public-12480-45859-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-12480-public-12480-45859-1-PB.pdf.pdf		articles-12480-public-12480-45859PB.pdf.xml

articles-12492-public-12492-45905-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12492-public-12492-45905-1-PB.pdf.pdf		articles-12492-public-12492-45905PB.pdf.xml

articles-12493-public-12493-45909-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12493-public-12493-45909-1-PB.pdf.pdf		articles-12493-public-12493-45909PB.pdf.xml

articles-12862-public-12862-47925-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-12862-public-12862-47925-1-PB.pdf.pdf		articles-12862-public-12862-47925-1-PB.pdf.xml

articles-12912-public-12912-47155-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12912-public-12912-47155-1-PB.pdf.pdf		articles-12912-public-12912-47155-1-PB.pdf.xml

articles-12914-public-12914-47161-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12914-public-12914-47161-1-PB.pdf.pdf		articles-12914-public-12914-47161-1-PB.pdf.xml

articles-12916-public-12916-47169-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12916-public-12916-47169-1-PB.pdf.pdf		articles-12916-public-12916-47169-1-PB.pdf.xml

articles-12917-public-12917-47173-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12917-public-12917-47173-1-PB.pdf.pdf		articles-12917-public-12917-47173-1-PB.pdf.xml

articles-12921-public-12921-47186-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12921-public-12921-47186-1-PB.pdf.pdf		articles-12921-public-12921-47186-1-PB.pdf.xml

articles-12922-public-12922-47190-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12922-public-12922-47190-1-PB.pdf.pdf		articles-12922-public-12922-47190-1-PB.pdf.xml

articles-12923-public-12923-47194-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12923-public-12923-47194-1-PB.pdf.pdf		articles-12923-public-12923-47194-1-PB.pdf.xml

articles-12926-public-12926-47206-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12926-public-12926-47206-1-PB.pdf.pdf		articles-12926-public-12926-47206-1-PB.pdf.xml

articles-12930-public-12930-47218-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12930-public-12930-47218-1-PB.pdf.pdf		articles-12930-public-12930-47218-1-PB.pdf.xml

articles-12931-public-12931-47223-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12931-public-12931-47223-1-PB.pdf.pdf		articles-12931-public-12931-47223-1-PB.pdf.xml

articles-12937-public-12937-47247-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12937-public-12937-47247-1-PB.pdf.pdf		articles-12937-public-12937-47247-1-PB.pdf.xml

articles-12938-public-12938-47251-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12938-public-12938-47251-1-PB.pdf.pdf		articles-12938-public-12938-47251-1-PB.pdf.xml

articles-12939-public-12939-47255-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-12939-public-12939-47255-1-PB.pdf.pdf		articles-12939-public-12939-47255-1-PB.pdf.xml

articles-12943-public-12943-47271-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-12943-public-12943-47271-1-PB.pdf.pdf		articles-12943-public-12943-47271-1-PB.pdf.xml

articles-12946-public-12946-47284-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-12946-public-12946-47284-1-PB.pdf.pdf		articles-12946-public-12946-47284-1-PB.pdf.xml

articles-12948-public-12948-47292-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12948-public-12948-47292-1-PB.pdf.pdf		articles-12948-public-12948-47292-1-PB.pdf.xml

articles-12949-public-12949-47296-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12949-public-12949-47296-1-PB.pdf.pdf		articles-12949-public-12949-47296-1-PB.pdf.xml

articles-12954-public-12954-47314-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12954-public-12954-47314-1-PB.pdf.pdf		articles-12954-public-12954-47314-1-PB.pdf.xml

articles-12955-public-12955-47318-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12955-public-12955-47318-1-PB.pdf.pdf		articles-12955-public-12955-47318-1-PB.pdf.xml

articles-12979-public-12979-47422-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12979-public-12979-47422-1-PB.pdf.pdf		articles-12979-public-12979-47422-1-PB.pdf.xml

articles-12981-public-12981-47430-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-12981-public-12981-47430-1-PB.pdf.pdf		articles-12981-public-12981-47430-1-PB.pdf.xml

articles-13125-public-13125-47949-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-13125-public-13125-47949-1-PB.pdf.pdf		articles-13125-public-13125-47949-1-PB.pdf.xml

articles-13126-public-13126-47950-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13126-public-13126-47950-1-PB.pdf.pdf		articles-13126-public-13126-47950-1-PB.pdf.xml

articles-13127-public-13127-47951-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13127-public-13127-47951-1-PB.pdf.pdf		articles-13127-public-13127-47951-1-PB.pdf.xml

articles-13130-public-13130-47953-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-13130-public-13130-47953-1-PB.pdf.pdf		articles-13130-public-13130-47953-1-PB.pdf.xml

articles-13136-public-13136-47965-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13136-public-13136-47965-1-PB.pdf.pdf		articles-13136-public-13136-47965-1-PB.pdf.xml

articles-13137-public-13137-47969-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13137-public-13137-47969-1-PB.pdf.pdf		articles-13137-public-13137-47969-1-PB.pdf.xml

articles-13138-public-13138-47971-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13138-public-13138-47971-1-PB.pdf.pdf		articles-13138-public-13138-47971-1-PB.pdf.xml

articles-13205-public-13205-48219-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13205-public-13205-48219-1-PB.pdf.pdf		articles-13205-public-13205-48219-1-PB.pdf.xml

articles-13206-public-13206-48236-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13206-public-13206-48236-1-PB.pdf.pdf		articles-13206-public-13206-48236-1-PB.pdf.xml

articles-13207-public-13207-48238-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13207-public-13207-48238-1-PB.pdf.pdf		articles-13207-public-13207-48238-1-PB.pdf.xml

articles-13209-public-13209-48240-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13209-public-13209-48240-1-PB.pdf.pdf		articles-13209-public-13209-48240-1-PB.pdf.xml

articles-13210-public-13210-48241-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13210-public-13210-48241-1-PB.pdf.pdf		articles-13210-public-13210-48241-1-PB.pdf.xml

articles-13211-public-13211-48242-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13211-public-13211-48242-1-PB.pdf.pdf		articles-13211-public-13211-48242-1-PB.pdf.xml

articles-13219-public-13219-48246-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13219-public-13219-48246-1-PB.pdf.pdf		articles-13219-public-13219-48246-1-PB.pdf.xml

articles-13224-public-13224-48268-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13224-public-13224-48268-1-PB.pdf.pdf		articles-13224-public-13224-48268-1-PB.pdf.xml

articles-13225-public-13225-48272-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13225-public-13225-48272-1-PB.pdf.pdf		articles-13225-public-13225-48272-1-PB.pdf.xml

articles-13226-public-13226-48276-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13226-public-13226-48276-1-PB.pdf.pdf		articles-13226-public-13226-48276-1-PB.pdf.xml

articles-13227-public-13227-48280-1-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13227-public-13227-48280-1-PB.pdf.pdf		articles-13227-public-13227-48280-1-PB.pdf.xml

articles-13260-public-13260-48395-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13260-public-13260-48395-2-PB.pdf.pdf		articles-13260-public-13260-48395-2-PB.pdf.xml

articles-13261-public-13261-48399-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-13261-public-13261-48399-2-PB.pdf.pdf		articles-13261-public-13261-48399-2-PB.pdf.xml

articles-13262-public-13262-48403-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13262-public-13262-48403-2-PB.pdf.pdf		articles-13262-public-13262-48403-2-PB.pdf.xml

articles-13263-public-13263-48407-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13263-public-13263-48407-2-PB.pdf.pdf		articles-13263-public-13263-48407-2-PB.pdf.xml

articles-13265-public-13265-48415-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT	articles-13265-public-13265-48415-2-PB.pdf.pdf		articles-13265-public-13265-48415-2-PB.pdf.xml

articles-13266-public-13266-48419-2-PB.pdf.pdf FRONT
	Check for Matching Text Elems FRONT 	articles-13266-public-13266-48419-2-PB.pdf.pdf		articles-13266-public-13266-48419-2-PB.pdf.xml
