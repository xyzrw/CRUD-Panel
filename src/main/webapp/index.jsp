<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="js/index.js" defer></script>
    <link href="css/index.css" rel="stylesheet">
    <title>Config Panel</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
<%--    <script>--%>
<%--        function sendRequest(typeName) {--%>
<%--            const http = new XMLHttpRequest()--%>

<%--            http.open("GET", "/config?mName='" + typeName + "'")--%>
<%--            http.send()--%>
<%--            // http.onload = () => console.log(http.responseText)--%>
<%--        }--%>
<%--    </script>--%>
    <script>
        $(document).on("click", "#btn-search", function() {
            $.get("configUpdate?mName2='"+document.getElementsByName('mName2')[0].value+"'", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#name-txt2").val(responseJson[0]);
                    $("#r-date-txt2").val(responseJson[2]);
                    $("#genre-txt2").val(responseJson[3]);
                    $("#rating-txt2").val(responseJson[4]);
                    $("#duration-txt2").val(responseJson[5]);
                    $("#desc-txt2").val(responseJson[6]);
                    $("#trailer-txt").val(responseJson[7]);
                    $("#tkt-txt").val(responseJson[8]);
                    $("#search-img").attr('src',responseJson[1]);
                    // $("#mNameTxt").val(item);
                });
            });
        });

        $(document).on("click", "#btn-fetch", function() {
            $.get("config?mName='"+document.getElementsByName('mName')[0].value+"'", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#name-txt").val(responseJson[0]);
                    $("#r-date-txt").val(responseJson[1]);
                    $("#rating-txt").val(responseJson[2]);
                    $("#desc-txt").val(responseJson[3]);
                    $("#fetch-img").attr('src',responseJson[4]);
                    $("#genre-txt").val(responseJson[5]);
                    $("#duration-txt").val(responseJson[6]);
                    $("#trailer_url").val(responseJson[7]);
                });
            });
        });

    </script>
    <script>
        let x=1;
        $(document).ready(function() {
            $.post("configUM", function(responseJson) {
                $.each(responseJson, function(index, item) {

                $("#dsp-p"+x.toString()).text(item);

                x++;

                });
            });
        });
    </script>

    <script>
        let z=1;
        $(document).ready(function() {
            $.post("configLM", function(responseJson) {
                $.each(responseJson, function(index, item) {

                    $("#dsp-lp"+z.toString()).text(item);

                    z++;

                });
            });
        });
    </script>

    <script>
        let y=1;
        $(document).ready(function() {
            $.post("configNS", function(responseJson) {
                $.each(responseJson, function(index, item) {

                    $("#dsp-ns-p"+y.toString()).text(item);

                    y++;

                });
            });
        });
    </script>

</head>
<body>
<div class="tabs">
    <input type="button" data-tab-target="#add-m" class="active tab" value="Add Movies">
    <input type="button" data-tab-target="#update-m" class="tab" value="Update Movies">
    <input type="button" data-tab-target="#latest-m" class="tab" value="Latest Movies">
    <input type="button" data-tab-target="#upcoming-m" class="tab" value="Upcoming Movies" >
    <input type="button" data-tab-target="#n-s-m" class="tab" value="Now Showing Movies">
</div>

<div class="tab-content">
    <div class="panel active" id="add-m" data-tab-content class="active">
        <div class="tab-title"><h2 class="tab-title-id">Add Movies</h2></div>
        <div class="inner-panel">
            <div class="left-panel">
                <form action="config" method="post" enctype="multipart/form-data">
                <div class="rowl">
                    <div class="rname">Movie Name:</div>
                    <div class="rtype"><input type="text"  class="mxmw"  id="name-txt" name="mName"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Release Date:</div>
                    <div class="rtype"><input type="text"  class="mxmw" id="r-date-txt" name="release-date"></div>
                </div>
                    <div class="rowl">
                        <div class="rname">Duration:</div>
                        <div class="rtype"><input type="text" class="mxmw" id="duration-txt" name="duration"></div>
                    </div>
                <div class="rowl">
                    <div class="rname">Genre:</div>
                    <div class="rtype"><input type="text"  class="mxmw" id="genre-txt" name="genre"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Rating:</div>
                    <div class="rtype"><input type="text" class="mxmw"  id="rating-txt" name="rating"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Ticket Price:</div>
                    <div class="rtype"><input type="text" class="mxmw" name="ticket-price"></div>
                </div>
                <div class="rowr btns">
                    <div class="rtype-btn"><input type="button" value="Fetch" id="btn-fetch" class="btn-fetch" ></div>
                    <div class="rtype-btn"><input type="reset" value="Reset" id="btn-reset" class="btn-reset"></div>
                    <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit" class="btn-submit"></div>
                </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Description:</div>
<%--                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="desc-txt" name="description"></div>--%>
                    <div class="rtype"><textarea  id="desc-txt" name="description" cols="15" rows="7"></textarea></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype" ><input type="text" id="trailer_url"   class="mxmw"  name="trailer_url"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file"  accept="image/*" class="img" name="file"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/cinema-1294496__340.png" class="dsp-img" id="fetch-img" alt="fetch-img">
                </div>
            </div>
            </form>
        </div>
    </div>


    <div class="panel" id="update-m" data-tab-content>
        <div class="tab-title"><h2 class="tab-title-id">Update Movies</h2></div>
        <div class="inner-panel">
            <div class="left-panel">
                <form action="configUpdate" method="post" enctype="multipart/form-data">
                    <div class="rowl">
                        <div class="rname">Movie Name:</div>
                        <div class="rtype"><input type="text"  class="mxmw"  id="name-txt2" name="mName2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Release Date:</div>
                        <div class="rtype"><input type="text"  class="mxmw" id="r-date-txt2" name="release-date2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Duration:</div>
                        <div class="rtype"><input type="text" class="mxmw" id="duration-txt2" name="duration2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Genre:</div>
                        <div class="rtype"><input type="text"  class="mxmw" id="genre-txt2" name="genre2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Rating:</div>
                        <div class="rtype"><input type="text" class="mxmw"  id="rating-txt2" name="rating2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Ticket Price:</div>
                        <div class="rtype"><input type="text" class="mxmw" id="tkt-txt" name="ticket-price2"></div>
                    </div>
                    <div class="rowr btns">
                        <div class="rtype-btn"><input type="button" value="Search" class="btn-fetch" id="btn-search"></div>
                        <div class="rtype-btn"><input type="reset" value="Reset" id="btn-reset" class="btn-reset"></div>
                        <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit" class="btn-submit"></div>
                    </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Description:</div>
                    <%--                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="desc-txt" name="description"></div>--%>
                    <div class="rtype"><textarea  id="desc-txt2" name="description2" cols="15" rows="7"></textarea></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype" ><input type="text"  class="mxmw" id="trailer-txt"  name="trailer_url2"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file" accept="image/*" class="img" name="file2"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/cinema-1294496__340.png" class="dsp-img" id="search-img" alt="search-img">
                </div>
            </div>
            </form>
        </div>
    </div>


    <script>
        $(document).on("click", "#lm-search-submit", function() {
            $.get("configLM?sName='"+document.getElementsByName('text-l-movie-nm')[0].value+"'", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#spn-id-l").text(responseJson[0]);
                    $("#spn-name-l").text(responseJson[1]);
                });
            });
        });
    </script>

    <div class="panel" id="latest-m" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <div class="wrap">
                        <div class="search">
                            <input type="text" class="searchTerm" name="text-l-movie-nm" placeholder="Search..." >
                            <button type="submit" class="searchButton" name="submit-uc-search" id="lm-search-submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span id="spn-id-l">____</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span id="spn-name-l">____________</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="configLM" method="get" name="add-form-uc">
                            <input type="hidden" name="AddReady" value="1">
                            <input type="submit" name="add-form-uc-submit" value="Add" class="add-form-uc-submit" >
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function sendLmDltRequest(typeName) {
                    const http = new XMLHttpRequest()

                    http.open("GET", "/configLM?dltRec='" + typeName + "'");
                    http.send();
                    http.onload = () => {
                        if(http.responseText==="1"){
                            window.alert("Record Deleted Successfully");
                        }else{
                            window.alert("Process Failed");
                        }
                    };
                }

            </script>
            <div class="dsp-svd">
                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp1">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp2">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp3">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp4">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button  class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp1').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp5">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp6">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp7">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp8">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp5').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp9">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp10">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp11">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp12">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp9').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp13">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp14">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp15">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp16">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp13').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp17">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp18">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp19">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp20">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp17').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-lp21">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp22">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp23">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-lp24">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendLmDltRequest(document.getElementById('dsp-lp21').textContent)">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).on("click", "#ucm-search-submit", function() {
            $.get("configUM?sName='"+document.getElementsByName('text-uc-movie-nm')[0].value+"'", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#spn-id-uc").text(responseJson[0]);
                    $("#spn-name-uc").text(responseJson[1]);
                });
            });
        });
    </script>

    <div class="panel" id="upcoming-m" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <div class="wrap">
                        <div class="search">
                            <input type="text" class="searchTerm" name="text-uc-movie-nm" placeholder="Search..."  id="text-uc-movie-id">
                            <button type="submit" class="searchButton" name="submit-uc-search" id="ucm-search-submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span id="spn-id-uc">____</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span id="spn-name-uc">____________</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="configUM" method="get" name="add-form-uc">
                            <input type="hidden" name="AddReady" value="1">
                            <input type="submit" name="add-form-uc-submit" value="Add" class="add-form-uc-submit" >
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function sendDltRequest(typeName) {
                    const http = new XMLHttpRequest()

                    http.open("GET", "/configUM?dltRec='" + typeName + "'");
                    http.send();
                    http.onload = () => {
                        if(http.responseText==="1"){
                            window.alert("Record Deleted Successfully");
                        }else{
                            window.alert("Process Failed");
                        }
                    };
                }

            </script>
            <div class="dsp-svd">
                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p1">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p2">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p3">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p4">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn1" class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p1').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p5">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p6">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p7">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p8">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p5').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p9">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p10">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p11">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p12">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p9').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p13">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p14">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p15">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p16">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p13').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p17">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p18">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p19">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p20">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p17').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-p21">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p22">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p23">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-p24">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendDltRequest(document.getElementById('dsp-p21').textContent)">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).on("click", "#ns-search-submit", function() {
            $.get("configNS?sName='"+document.getElementsByName('text-ns-movie')[0].value+"'", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#spn-id-ns").text(responseJson[0]);
                    $("#spn-name-ns").text(responseJson[1]);
                });
            });
        });
    </script>

    <div class="panel" id="n-s-m" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <div class="wrap">
                        <div class="search">
                            <input type="text" class="searchTerm"  placeholder="Search..."  name="text-ns-movie">
                            <button type="submit" class="searchButton" name="submit-uc-search"  id="ns-search-submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span id="spn-id-ns">____</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span id="spn-name-ns">____________</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="configNS" method="get" name="add-form-uc">
                            <input type="hidden" name="AddReady" value="1">
                            <input type="submit" name="add-form-uc-submit" value="Add" class="add-form-uc-submit">
                        </form>
                    </div>
                </div>
            </div>

            <script>

                function sendNsDltRequest(typeName) {
                    const http = new XMLHttpRequest()

                    http.open("GET", "/configNS?dltRec='" + typeName + "'");
                    http.send();
                    http.onload = () => {
                        if(http.responseText==="1"){
                            window.alert("Record Deleted Successfully");
                        }else{
                            window.alert("Process Failed");
                        }
                    };
                }

            </script>


            <div class="dsp-svd">
                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p1">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p2">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p3">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p4">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p1').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p5">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p6">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p7">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p8">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p5').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p9">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p10">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p11">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p12">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p9').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p13">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p14">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p15">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p16">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p13').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p17">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p18">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p19">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p20">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p17').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p21">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p22">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p23">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p24">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p21').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p25">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p26">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p27">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p28">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p25').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p29">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p30">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p31">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p32">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p29').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p33">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p34">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p35">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p36">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p33').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p37">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p38">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p39">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p40">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p37').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p41">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p42">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p43">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p44">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p41').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p45">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p46">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p47">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p48">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p45').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p49">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p50">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p51">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p52">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p49').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p53">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p54">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p55">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p56">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p53').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p57">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p58">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p59">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p60">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p57').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p61">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p62">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p63">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p64">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p61').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p65">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p66">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p67">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p68">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p65').textContent)">Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p id="dsp-ns-p69">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p70">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p71">______</p></div>
                    <div class="dsp-uc-inner"><p id="dsp-ns-p72">______</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button class="dlt-btn" onclick="sendNsDltRequest(document.getElementById('dsp-ns-p69').textContent)">Delete</button>
                    </div>
                </div>


            </div>
        </div>
    </div>

</div>
</body>
</html>