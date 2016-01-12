*** Settings ***

Documentation 		This test goes through every file in the corpus and sees if a conversion process occurred and if only the accepted errors were passed through and if the XML files matches JATS format. This covers the BODY corpus. Dueto the directory upkeep this test performs, this test should always be run FIRST.

Resource	resources.robot

*** Test Cases ***

Error Folder Clean
	Remove File		incompleteFiles
	Create File		incompleteFiles
	Remove File		incompleteFileTotal
	Create File		incompleteFileTotal		0
	Remove Directory	failDetails	recursive=True
	Create Directory	failDetails
	Create Directory	failDetails/xref
	Create Directory	failDetails/xref/all_xref
	Create Directory	failDetails/samplesInConvert/
	Create Directory	failDetails/convertsInSample/
	Create Directory	failDetails/samplesInConvert/allTags
	Create Directory	failDetails/convertsInSample/allTags
	:FOR 	${filePath}	IN	@{fileNamesList}
	\	Create Directory	failDetails/convertsInSample/${filePath}
	\	Create Directory	failDetails/samplesInConvert/${filePath}
	:FOR	${filePath}		IN	@{fileNamesList1}
		\	Create Directory	failDetails/convertsInSample/${filePath}
		\	Create Directory	failDetails/samplesInConvert/${filePath}
	:FOR	${filePath}		IN	@{fileNamesList2}
		\	Create Directory	failDetails/convertsInSample/${filePath}
		\	Create Directory	failDetails/samplesInConvert/${filePath}
		:FOR	${filePath}		IN	@{fileNamesList3}
		\	Create Directory	failDetails/convertsInSample/${filePath}
		\	Create Directory	failDetails/samplesInConvert/${filePath}
	:FOR	${testingElem}	IN	@{necessaryMatchElems}
	\	${stringRep}=	Replace String	${testingElem}	/	_
	\	${stringRep}=	Replace String	${stringRep}	.	DOT
	\	Create Directory 	failDetails/samplesInConvert/allTags/${stringRep}
	\	Create Directory	failDetails/convertsInSample/allTags/${stringRep}

10207-34165-1-CE.doc BODY
	Check for Matching Text Elems 	10207-34165-1-CE.doc	10207-34165-1-CE/10207-34165-1-CE.xml

10494-34636-4-RV.docx BODY
	Check for Matching Text Elems	10494-34636-4-RV.docx 	10494-34636-4-RV/10494-34636-4-RV.xml

10674-35087-6-RV.doc BODY
	Check for Matching Text Elems 	10674-35087-6-RV.doc 	10674-35087-6-RV/10674-35087-6-RV.xml

10888-35745-2-RV.doc BODY
	Check for Matching Text Elems 	10888-35745-2-RV.doc	10888-35745-2-RV/10888-35745-2-RV.xml

10961-36032-1-CE.doc BODY
	Check for Matching Text Elems 	10961-36032-1-CE.doc 	10961-36032-1-CE/10961-36032-1-CE.xml

11075-36386-2-RV.doc BODY
	Check for Matching Text Elems 	11075-36386-2-RV.doc	11075-36386-2-RV/11075-36386-2-RV.xml

11584-47256-1-CE.docx BODY
	Check for Matching Text Elems	11584-47256-1-CE.docx	11584-47256-1-CE/11584-47256-1-CE.xml

11905-51532-1-CE.docx BODY
	Check for Matching Text Elems 	11905-51532-1-CE.docx	11905-51532-1-CE/11905-51532-1-CE.xml

14784-50749-1-ED.docx BODY
	Check for Matching Text Elems   14784-50749-1-ED.docx	14784-50749-1-ED/14784-50749-1-ED.xml

14919-43580-1-CE.doc BODY
	Check for Matching Text Elems 	14919-43580-1-CE.doc 	14919-43580-1-CE/14919-43580-1-CE.xml

15693-47246-1-ED.doc BODY
	Check for Matching Text Elems 	15693-47246-1-ED.doc	15693-47246-1-ED/15693-47246-1-ED.xml
	
15761-53375-1-AT.docx BODY
	Check for Matching Text Elems 	15761-53375-1-AT	15761-53375-1-AT/15761-53375-1-AT.xml

15895-46314-1-CE.docx BODY
	Check for Matching Text Elems   15895-46314-1-CE.docx	15895-46314-1-CE/15895-46314-1-CE.xml

15896-57002-1-CE.docx BODY
	Check for Matching Text Elems 	15896-57002-1-CE.docx 	15896-57002-1-CE/15896-57002-1-CE.xml

1654-2012-1-CE.doc BODY
	Check for Matching Text Elems 	1654-2012-1-CE.doc 	1654-2012-1-CE/1654-2012-1-CE.xml

17163-50171-1-LE.docx BODY
	Check for Matching Text Elems	17163-50171-1-LE.docx	17163-50171-1-LE/17163-50171-1-LE.xml

17195-54253-1-CE.doc BODY
	Check for Matching Text Elems   17195-54253-1-CE.doc	17195-54253-1-CE/17195-54253-1-CE.xml

17206-50385-1-CE.docx BODY
	Check for Matching Text Elems   17206-50385-1-CE.docx	17206-50385-1-CE/17206-50385-1-CE.xml

17291-51450-1-LE.doc BODY
	Check for Matching Text Elems 	17291-51450-1-LE.doc	17291-51450-1-LE/17291-51450-1-LE.xml

17324-51879-1-LE.doc BODY
	Check for Matching Text Elems	17324-51879-1-LE.doc	17324-51879-1-LE/17324-51879-1-LE.xml

17508-61154-1-CE.docx BODY
	Check for Matching Text Elems 	17508-61154-1-CE.docx 	17508-61154-1-CE/17508-61154-1-CE.xml

17718-58673-1-CE.doc BODY
	Check for Matching Text Elems   17718-58673-1-CE.doc	17718-58673-1-CE/17718-58673-1-CE.xml

18191-58929-1-CE.docx BODY
	Check for Matching Text Elems   18191-58929-1-CE.docx	18191-58929-1-CE/18191-58929-1-CE.xml

1821-2390-1-CE.doc BODY
	Check for Matching Text Elems   1821-2390-1-CE.doc 	1821-2390-1-CE/1821-2390-1-CE.xml

18563-59553-1-LE.doc BODY
	Check for Matching Text Elems	18563-59553-1-LE.doc 	18563-59553-1-LE/18563-59553-1-LE.xml

18585-59779-1-LE.docx BODY
	Check for Matching Text Elems 	18585-59779-1-LE.docx 	18585-59779-1-LE/18585-59779-1-LE.xml

18600-59966-4-RV.doc BODY
	Check for Matching Text Elems	18600-59966-4-RV.doc	18600-59966-4-RV/18600-59966-4-RV.xml

18637-60552-1-CE.doc BODY
	Check for Matching Text Elems	18637-60552-1-CE.doc	18637-60552-1-CE/18637-60552-1-CE.xml

18645-60626-4-RV.doc BODY
	Check for Matching Text Elems 	18645-60626-4-RV.doc	18645-60626-4-RV/18645-60626-4-RV.xml
	
18701-63288-1-CE.docx BODY
	Check for Matching Text Elems   18701-63288-1-CE.docx	18701-63288-1-CE/18701-63288-1-CE.xml

18712-63573-1-CE.doc BODY
	Check for Matching Text Elems   18712-63573-1-CE.doc	18712-63573-1-CE/18712-63573-1-CE.xml

18820-62235-1-LE.doc BODY
	Check for Matching Text Elems   18820-62235-1-LE.doc	18820-62235-1-LE/18820-62235-1-LE.xml

1882-10716-1-CE.doc BODY
	Check for Matching Text Elems	1882-10716-1-CE.doc 	1882-10716-1-CE/1882-10716-1-CE.xml

1883-2969-2-RV.doc BODY
	Check for Matching Text Elems	1883-2969-2-RV.doc	1883-2969-2-RV/1883-2969-2-RV.xml

18838-66143-1-CE.docx BODY
	Check for Matching Text Elems   18838-66143-1-CE.docx	18838-66143-1-CE/18838-66143-1-CE.xml

19037-65173-1-CE.docx BODY
	Check for Matching Text Elems   19037-65173-1-CE.docx	19037-65173-1-CE/19037-65173-1-CE.xml

1905-3612-1-CE.doc BODY
	Check for Matching Text Elems 	1905-3612-1-CE.doc	1905-3612-1-CE/1905-3612-1-CE.xml

19081-65498-1-CE.docx BODY
	Check for Matching Text Elems 	19081-65498-1-CE.docx 	19081-65498-1-CE/19081-65498-1-CE.xml

19159-66544-3-RV.docx BODY
	Check for Matching Text Elems   19159-66544-3-RV.docx	19159-66544-3-RV/19159-66544-3-RV.xml

19254-71104-1-CE.docx BODY
	Check for Matching Text Elems   19254-71104-1-CE.docx	19254-71104-1-CE/19254-71104-1-CE.xml

19299-69543-1-CE.docx BODY
	Check for Matching Text Elems 	19299-69543-1-CE.docx 	19299-69543-1-CE/19299-69543-1-CE.xml

19766-71799-1-CE.docx BODY
	Check for Matching Text Elems	19766-71799-1-CE.docx	19766-71799-1-CE/19766-71799-1-CE.xml

19785-72111-1-CE.docx BODY
	Check for Matching Text Elems   19785-72111-1-CE.docx	19785-72111-1-CE/19785-72111-1-CE.xml

20043-74994-5-RV.docx BODY
	Check for Matching Text Elems 	20043-74994-5-RV.docx	20043-74994-5-RV/20043-74994-5-RV.xml

20069-75242-1-CE.docx BODY
	Check for Matching Text Elems   20069-75242-1-CE.docx	20069-75242-1-CE/20069-75242-1-CE.xml

20072-75240-3-RV.doc BODY
	Check for Matching Text Elems	20072-75240-3-RV.doc 	20072-75240-3-RV/20072-75240-3-RV.xml

20150-76776-1-CE.doc BODY
	Check for Matching Text Elems   20150-76776-1-CE.doc	20150-76776-1-CE/20150-76776-1-CE.xml

20157-81103-1-CE.doc BODY
	Check for Matching Text Elems	  20157-81103-1-CE.doc		  20157-81103-1-CE/20157-81103-1-CE.xml

20169-76684-1-CE.doc BODY
	Check for Matching Text Elems 	20169-76684-1-CE.doc  	20169-76684-1-CE/20169-76684-1-CE.xml

20175-78196-1-ED.doc BODY
	Check for Matching Text Elems	  20175-78196-1-ED.doc 		  20175-78196-1-ED/20175-78196-1-ED.xml

20241-76952-1-CE.docx BODY
	Check for Matching Text Elems   20241-76952-1-CE.docx	20241-76952-1-CE/20241-76952-1-CE.xml

20325-78073-1-AT.docx BODY
	Check for Matching Text Elems	20325-78073-1-AT.docx	20325-78073-1-AT/20325-78073-1-AT.xml

20389-79085-1-AT.docx BODY
	Check for Matching Text Elems   20389-79085-1-AT.docx	20389-79085-1-AT/20389-79085-1-AT.xml

20498-81129-1-LE.doc BODY
	Check for Matching Text Elems	20498-81129-1-LE.doc 	20498-81129-1-LE/20498-81129-1-LE.xml

20644-82910-1-CE.doc BODY
	Check for Matching Text Elems   20644-82910-1-CE.doc	20644-82910-1-CE/20644-82910-1-CE.xml

20676-82914-1-CE.doc BODY
	Check for Matching Text Elems   20676-82914-1-CE.doc	20676-82914-1-CE/20676-82914-1-CE.xml

20679-92916-1-ED.docx BODY
	Check for Matching Text Elems	 20679-92916-1-ED.docx 		 20679-92916-1-ED/20679-92916-1-ED.xml

20763-83630-1-CE.docx BODY
	Check for Matching Text Elems	20763-83630-1-CE.docx 		20763-83630-1-CE/20763-83630-1-CE.xml

20873-84696-1-CE.doc BODY
	Check for Matching Text Elems   20873-84696-1-CE.doc	20873-84696-1-CE/20873-84696-1-CE.xml

20961-85895-1-CE.docx BODY
	Check for Matching Text Elems 	20961-85895-1-CE.docx 	20961-85895-1-CE/20961-85895-1-CE.xml

20973-85688-1-LE.doc BODY
	Check for Matching Text Elems 	20973-85688-1-LE.doc	20973-85688-1-LE/20973-85688-1-LE.xml 

20981-87625-1-CE.docx BODY
	Check for Matching Text Elems 	20981-87625-1-CE.docx 	20981-87625-1-CE/20981-87625-1-CE.xml

21028-86430-1-CE.docx BODY
	Check for Matching Text Elems   21028-86430-1-CE.docx	21028-86430-1-CE/21028-86430-1-CE.xml

21070-86651-1-LE.docx BODY
	Check for Matching Text Elems	21070-86651-1-LE.docx	21070-86651-1-LE/21070-86651-1-LE.xml

21189-87585-1-LE.docx BODY
	Check for Matching Text Elems	21189-87585-1-LE.docx	21189-87585-1-LE/21189-87585-1-LE.xml

21207-87683-1-CE.docx BODY
	Check for Matching Text Elems	21207-87683-1-CE.docx	21207-87683-1-CE/21207-87683-1-CE.xml

21217-89981-1-CE.docx BODY
	Check for Matching Text Elems	21217-89981-1-CE.docx	21217-89981-1-CE/21217-89981-1-CE.xml

21241-88691-1-LE.docx BODY
	Check for Matching Text Elems 	21241-88691-1-LE.docx 	21241-88691-1-LE/21241-88691-1-LE.xml

21305-89182-1-CE.docx BODY
	Check for Matching Text Elems 	21305-89182-1-CE.docx	21305-89182-1-CE/21305-89182-1-CE.xml

21316-89262-1-LE.docx BODY
	Check for Matching Text Elems	21316-89262-1-LE.docx	21316-89262-1-LE/21316-89262-1-LE.xml

21419-92410-1-CE.docx BODY
	Check for Matching Text Elems   21419-92410-1-CE.docx	21419-92410-1-CE/21419-92410-1-CE.xml

21569-91658-1-CE.doc BODY
	Check for Matching Text Elems	21569-91658-1-CE.doc	21569-91658-1-CE/21569-91658-1-CE.xml

21581-91729-2-RV.docx BODY
	Check for Matching Text Elems	21581-91729-2-RV.docx	21581-91729-2-RV/21581-91729-2-RV.xml

21636-92556-2-RV.doc BODY
	Check for Matching Text Elems	21636-92556-2-RV.doc 	21636-92556-2-RV/21636-92556-2-RV.xml

21687-92986-1-LE,doc BODY
	Check for Matching Text Elems	21687-92986-1-LE.doc	21687-92986-1-LE/21687-92986-1-LE.xml

21747-93864-1-CE.docx BODY
	Check for Matching Text Elems   21747-93864-1-CE.docx	21747-93864-1-CE/21747-93864-1-CE.xml

21819-99168-1-CE.docx BODY
	Check for Matching Text Elems   21819-99168-1-CE.docx	21819-99168-1-CE/21819-99168-1-CE.xml

21914-95908-3-LE.docx BODY
	Check for Matching Text Elems	21914-95908-3-LE.docx 	21914-95908-3-LE/21914-95908-3-LE.xml

21921-102196-1-ED.doc BODY
	Check for Matching Text Elems	21921-102196-1-ED.doc	21921-102196-1-ED/21921-102196-1-ED.xml

22101-96574-1-CE.docx BODY
	Check for Matching Text Elems   22101-96574-1-CE.docx	22101-96574-1-CE/22101-96574-1-CE.xml

22503-99242-1-CE.doc BODY
	Check for Matching Text Elems   22503-99242-1-CE.doc	22503-99242-1-CE/22503-99242-1-CE.xml

22585-100490-1-CE.doc BODY
	Check for Matching Text Elems	22585-100490-1-CE.doc 	22585-100490-1-CE/22585-100490-1-CE.xml

22610-99914-1-LE.docx BODY
	Check for Matching Text Elems	22610-99914-1-LE.docx	22610-99914-1-LE/22610-99914-1-LE.xml

22627-104462-1-CE.docx BODY
	Check for Matching Text Elems   22627-104462-1-CE.docx	22627-104462-1-CE/22627-104462-1-CE.xml

22761-101296-3-RV.docx BODY
	Check for Matching Text Elems	22761-101296-3-RV.docx 	22761-101296-3-RV/22761-101296-3-RV.xml

22792-104701-3-ED.docx BODY
	Check for Matching Text Elems	22792-104701-3-ED.docx	22792-104701-3-ED/22792-104701-3-ED.xml

22875-106385-1-CE.docx BODY
	Check for Matching Text Elems   22875-106385-1-CE.docx		22875-106385-1-CE/22875-106385-1-CE.xml

22997-105170-1-CE.docx BODY
	Check for Matching Text Elems	22997-105170-1-CE.docx		22997-105170-1-CE/22997-105170-1-CE.xml

23114-121817-1-ED.docx BODY
	Check for Matching Text Elems	23114-121817-1-ED.docx		23114-121817-1-ED/23114-121817-1-ED.xml

23118-106028-2-ED.docx BODY
	Check for Matching Text Elems	23118-106028-2-ED.docx		23118-106028-2-ED/23118-106028-2-ED.xml

23165-107790-1-AT.docx BODY
	Check for Matching Text Elems	23165-107790-1-AT.docx		23165-107790-1-AT/23165-107790-1-AT.xml

23386-113859-1-CE.doc BODY
	Check for Matching Text Elems	23386-113859-1-CE.doc		23386-113859-1-CE/23386-113859-1-CE.xml

23438-135482-1-AT.docx BODY
	Check for Matching Text Elems	23438-135482-1-AT.docx 		23438-135482-1-AT/23438-135482-1-AT.xml

23445-112730-1-ED.doc BODY
	Check for Matching Text Elems	23445-112730-1-ED.doc		23445-112730-1-ED/23445-112730-1-ED.xml

23489-109739-1-CE.docx BODY
	Check for Matching Text Elems	23489-109739-1-CE.docx		23489-109739-1-CE/23489-109739-1-CE.xml

23507-109371-1-CE.doc BODY
	Check for Matching Text Elems	23507-109371-1-CE.doc		23507-109371-1-CE/23507-109371-1-CE.xml

23539-113627-1-CE.doc BODY
	Check for Matching Text Elems	23539-113627-1-CE.doc		23539-113627-1-CE/23539-113627-1-CE.xml

23575-110933-2-ED.docx BODY
	Check for Matching Text Elems	23575-110933-2-ED.docx		23575-110933-2-ED/23575-110933-2-ED.xml

23610-110568-1-CE.docx BODY
	Check for Matching Text Elems	23610-110568-1-CE.docx		23610-110568-1-CE/23610-110568-1-CE.xml

23693-111318-1-CE.docx BODY
	Check for Matching Text Elems   23693-111318-1-CE.docx 		23693-111318-1-CE/23693-111318-1-CE.xml

24270-124454-1-AT.docx BODY
	Check for Matching Text Elems	24270-124454-1-AT.docx		24270-124454-1-AT/24270-124454-1-AT.xml

24409-119845-1-CE.doc BODY
	Check for Matching Text Elems	24409-119845-1-CE.doc		24409-119845-1-CE/24409-119845-1-CE.xml

24562-130171-1-CE.docx BODY
	Check for Matching Text Elems	24562-130171-1-CE.docx		24562-130171-1-CE/24562-130171-1-CE.xml

25390-129192-1-CE.docx BODY
	Check for Matching Text Elems   25390-129192-1-CE.docx		25390-129192-1-CE/25390-129192-1-CE.xml

25774-132776-1-CE.docx BODY
	Check for Matching Text Elems   25774-132776-1-CE.docx		25774-132776-1-CE/25774-132776-1-CE.xml

25783-135785-1-AT.docx BODY
	Check for Matching Text Elems	25783-135785-1-AT.docx		25783-135785-1-AT/25783-135785-1-AT.xml

25856-140782-1-ED.docx BODY
	Check for Matching Text Elems	25856-140782-1-ED.docx		25856-140782-1-ED/25856-140782-1-ED.xml

25890-133887-2-RV.doc BODY
	Check for Matching Text Elems	25890-133887-2-RV.doc		25890-133887-2-RV/25890-133887-2-RV.xml

25919-134178-1-CE.doc BODY
	Check for Matching Text Elems   25919-134178-1-CE.doc 		25919-134178-1-CE/25919-134178-1-CE.xml

26128-142788-1-ED.doc BODY
	Check for Matching Text Elems	26128-142788-1-ED.doc		26128-142788-1-ED/26128-142788-1-ED.xml

26153-142650-1-CE.docx BODY
	Check for Matching Text Elems	26153-142650-1-CE.docx		26153-142650-1-CE/26153-142650-1-CE.xml

26552-141200-1-CE.docx BODY
	Check for Matching Text Elems   26552-141200-1-CE.docx		26552-141200-1-CE/26552-141200-1-CE.xml

26645-148029-1-LE.docx BODY
	Check for Matching Text Elems	26645-148029-1-LE.docx		26645-148029-1-LE/26645-148029-1-LE.xml

26666-142223-2-RV.doc BODY
	Check for Matching Text Elems	26666-142223-2-RV.doc		26666-142223-2-RV/26666-142223-2-RV.xml

26696-142795-1-CE.docx BODY
	Check for Matching Text Elems	26696-142795-1-CE.docx		26696-142795-1-CE/26696-142795-1-CE.xml

26745-143246-1-CE.docx BODY
	Check for Matching Text Elems	26745-143246-1-CE.docx		26745-143246-1-CE/26745-143246-1-CE.xml

26757-146453-1-ED.docx BODY
	Check for Matching Text Elems	26757-146453-1-ED.docx		26757-146453-1-ED/26757-146453-1-ED.xml

26873-150427-1-CE.docx BODY
	Check for Matching Text Elems	26873-150427-1-CE.docx		26873-150427-1-CE/26873-150427-1-CE.xml

26879-144157-1-CE.docx BODY
	Check for Matching Text Elems   26879-144157-1-CE.docx		26879-144157-1-CE/26879-144157-1-CE.xml

26913-144866-1-CE.docx BODY
	Check for Matching Text Elems	26913-144866-1-CE.docx		26913-144866-1-CE/26913-144866-1-CE.xml

26941-146971-1-LE.docx BODY
	Check for Matching Text Elems	26941-146971-1-LE.docx		26941-146971-1-LE/26941-146971-1-LE.xml

26971-145613-1-CE.doc BODY
	Check for Matching Text Elems	26971-145613-1-CE.doc		26971-145613-1-CE/26971-145613-1-CE.xml

27007-145748-1-CE.doc BODY
	Check for Matching Text Elems	27007-145748-1-CE.doc		27007-145748-1-CE/27007-145748-1-CE.xml

27010-145757-1-CE.doc BODY
	Check for Matching Text Elems	27010-145757-1-CE.doc		27010-145757-1-CE/27010-145757-1-CE.xml

27178-155558-1-ED.docx BODY
	Check for Matching Text Elems	27178-155558-1-ED.docx		27178-155558-1-ED/27178-155558-1-ED.xml

27199-149414-1-ED.docx BODY
	Check for Matching Text Elems	27199-149414-1-ED.docx		27199-149414-1-ED/27199-149414-1-ED.xml

27328-147850-1-CE.docx BODY
	Check for Matching Text Elems   27328-147850-1-CE.docx		27328-147850-1-CE/27328-147850-1-CE.xml

27380-153064-1-AT.docx BODY
	Check for Matching Text Elems	27380-153064-1-AT.docx		27380-153064-1-AT/27380-153064-1-AT.xml

27388-154068-1-CE.docx BODY
	Check for Matching Text Elems	27388-154068-1-CE.docx		27388-154068-1-CE/27388-154068-1-CE.xml

27503-150339-1-CE.doc BODY
	Check for Matching Text Elems	27503-150339-1-CE.doc		27503-150339-1-CE/27503-150339-1-CE.xml

27535-153755-1-CE.doc BODY
	Check for Matching Text Elems	27535-153755-1-CE.doc		27535-153755-1-CE/27535-153755-1-CE.xml

27628-151822-1-CE.docx BODY
	Check for Matching Text Elems	27628-151822-1-CE.docx		27628-151822-1-CE/27628-151822-1-CE.xml

27632-151838-1-CE.docx BODY
	Check for Matching Text Elems	27632-151838-1-CE.docx		27632-151838-1-CE/27632-151838-1-CE.xml

27634-151846-1-CE.docx BODY
	Check for Matching Text Elems	27634-151846-1-CE.docx		27634-151846-1-CE/27634-151846-1-CE.xml

28094-157988-1-CE.docx BODY
	Check for Matching Text Elems	28094-157988-1-CE.docx		28094-157988-1-CE/28094-157988-1-CE.xml

28188-159839-1-AT.docx BODY
	Check for Matching Text Elems	28188-159839-1-AT.docx		28188-159839-1-AT/28188-159839-1-AT.xml

28189-160689-1-CE.docx BODY
	Check for Matching Text Elems   28189-160689-1-CE.docx		28189-160689-1-CE/28189-160689-1-CE.xml

28544-160416-1-CE.docx BODY
	Check for Matching Text Elems	28544-160416-1-CE.docx		28544-160416-1-CE/28544-160416-1-CE.xml

28545-160421-1-CE.docx BODY
	Check for Matching Text Elems	28545-160421-1-CE.docx		28545-160421-1-CE/28545-160421-1-CE.xml

28643-161375-1-LE.doc BODY
	Check for Matching Text Elems	28643-161375-1-LE.doc		28643-161375-1-LE/28643-161375-1-LE.xml

28857-163791-3-RV.docx BODY
	Check for Matching Text Elems	28857-163791-3-RV.docx		28857-163791-3-RV/28857-163791-3-RV.xml

4275-7564-1-CE.doc BODY
	Check for Matching Text Elems	4275-7564-1-CE.doc		4275-7564-1-CE/4275-7564-1-CE.xml

4639-8020-1-CE.doc BODY
	Check for Matching Text Elems   4639-8020-1-CE.doc		4639-8020-1-CE/4639-8020-1-CE.xml

4847-8564-1-CE.docx BODY
	Check for Matching Text Elems	4847-8564-1-CE.docx		4847-8564-1-CE/4847-8564-1-CE.xml

4857-8414-1-CE.doc BODY
	Check for Matching Text Elems   4857-8414-1-CE.doc		4857-8414-1-CE/4857-8414-1-CE.xml

4879-8591-1-CE.doc BODY
	Check for Matching Text Elems   4879-8591-1-CE.doc		4879-8591-1-CE/4879-8591-1-CE.xml

4880-8603-1-LE.doc BODY
	Check for Matching Text Elems	4880-8603-1-LE.doc		4880-8603-1-LE/4880-8603-1-LE.xml

5052-9016-1-CE.doc BODY
	Check for Matching Text Elems	5052-9016-1-CE.doc		5052-9016-1-CE/5052-9016-1-CE.xml

5056-9055-1-CE.doc BODY
	Check for Matching Text Elems	5056-9055-1-CE.doc		5056-9055-1-CE/5056-9055-1-CE.xml

5122-9761-1-CE.doc BODY
	Check for Matching Text Elems	5122-9761-1-CE.doc		5122-9761-1-CE/5122-9761-1-CE.xml

5201-10147-1-CE.docx BODY
	Check for Matching Text Elems   5201-10147-1-CE.docx		5201-10147-1-CE/5201-10147-1-CE.xml

5223-10256-1-CE.doc BODY
	Check for Matching Text Elems	5223-10256-1-CE.doc		5223-10256-1-CE/5223-10256-1-CE.xml

5282-10572-1-CE.doc BODY
	Check for Matching Text Elems	5282-10572-1-CE.doc		5282-10572-1-CE/5282-10572-1-CE.xml

5329-14069-1-AT.doc BODY
	Check for Matching Text Elems	5329-14069-1-AT.doc		5329-14069-1-AT/5329-14069-1-AT.xml

5333-10869-3-RV.docx BODY
	Check for Matching Text Elems	5333-10869-3-RV.docx		5333-10869-3-RV/5333-10869-3-RV.xml

5458-11842-1-CE.doc BODY
	Check for Matching Text Elems	5458-11842-1-CE.doc		5458-11842-1-CE/5458-11842-1-CE.xml

5489-11927-1-CE.doc BODY
	Check for Matching Text Elems	5489-11927-1-CE.doc		5489-11927-1-CE/5489-11927-1-CE.xml

5693-13609-1-CE.doc BODY
	Check for Matching Text Elems   5693-13609-1-CE.doc		5693-13609-1-CE/5693-13609-1-CE.xml

5731-14474-1-CE.doc BODY
	Check for Matching Text Elems	5731-14474-1-CE.doc		5731-14474-1-CE/5731-14474-1-CE.xml

5743-13863-1-AT.doc BODY
	Check for Matching Text Elems	5743-13863-1-AT.doc		5743-13863-1-AT/5743-13863-1-AT.xml

5774-14429-1-CE.docx BODY
	Check for Matching Text Elems	5774-14429-1-CE.docx		5774-14429-1-CE/5774-14429-1-CE.xml

5978-17739-1-CE.doc BODY
	Check for Matching Text Elems	5978-17739-1-CE.doc		5978-17739-1-CE/5978-17739-1-CE.xml

6283-16863-1-CE.docx BODY
	Check for Matching Text Elems 	6283-16863-1-CE.docx		6283-16863-1-CE/6283-16863-1-CE.xml

6287-19169-1-CE.doc BODY
	Check for Matching Text Elems 	6287-19169-1-CE.doc		6287-19169-1-CE/6287-19169-1-CE.xml

6336-19171-1-CE.docx BODY
	Check for Matching Text Elems	6336-19171-1-CE.docx		6336-19171-1-CE/6336-19171-1-CE.xml

6373-17346-1-CE.docx BODY
	Check for Matching Text Elems	6373-17346-1-CE.docx		6373-17346-1-CE/6373-17346-1-CE.xml

7042-19458-1-CE.doc BODY
	Check for Matching Text Elems	7042-19458-1-CE.doc		7042-19458-1-CE/7042-19458-1-CE.xml

7126-19277-1-CE.doc BODY
	Check for Matching Text Elems	7126-19277-1-CE.doc		7126-19277-1-CE/7126-19277-1-CE.xml

7132-39061-1-CE.docx BODY
	Check for Matching Text Elems	7132-39061-1-CE.docx		7132-39061-1-CE/7132-39061-1-CE.xml

7135-19365-1-CE.doc BODY
	Check for Matching Text Elems	7135-19365-1-CE.doc		7135-19365-1-CE/7135-19365-1-CE.xml

7169-21193-1-CE.doc BODY
	Check for Matching Text Elems	7169-21193-1-CE.doc		7169-21193-1-CE/7169-21193-1-CE.xml

7186-20293-1-CE.doc BODY
	Check for Matching Text Elems	7186-20293-1-CE.doc		7186-20293-1-CE/7186-20293-1-CE.xml

7188-20299-1-ED.docx BODY
	Check for Matching Text Elems	7188-20299-1-ED.docx		7188-20299-1-ED/7188-20299-1-ED.xml

7200-21760-1-CE.doc BODY
	Check for Matching Text Elems	7200-21760-1-CE.doc		7200-21760-1-CE/7200-21760-1-CE.xml

7208-19924-1-CE.doc BODY
	Check for Matching Text Elems	7208-19924-1-CE.doc		7208-19924-1-CE/7208-19924-1-CE.xml

7216-20291-1-CE.docx BODY
	Check for Matching Text Elems	7216-20291-1-CE.docx		7216-20291-1-CE/7216-20291-1-CE.xml

7241-21759-1-CE.doc BODY
	Check for Matching Text Elems	7241-21759-1-CE.doc		7241-21759-1-CE/7241-21759-1-CE.xml

7252-21389-1-CE.doc BODY
	Check for Matching Text Elems	7252-21389-1-CE.doc		7252-21389-1-CE/7252-21389-1-CE.xml

7281-20741-1-CE.doc BODY
	Check for Matching Text Elems	7281-20741-1-CE.doc		7281-20741-1-CE/7281-20741-1-CE.xml

8312-26343-1-CE.doc BODY
	Check for Matching Text Elems	8312-26343-1-CE.doc		8312-26343-1-CE/8312-26343-1-CE.xml

8865-29162-1-CE.docx BODY
	Check for Mathcing Text Elems	8865-29162-1-CE.docx		8865-29162-1-CE/8865-29162-1-CE.xml
