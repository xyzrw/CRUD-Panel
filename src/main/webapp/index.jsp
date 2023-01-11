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
    <script>
        function sendRequest(typeName) {
            const http = new XMLHttpRequest()

            http.open("GET", "/config?mName='" + typeName + "'")
            http.send()
            // http.onload = () => console.log(http.responseText)
        }
        // function sendRequestUpdate(typeName) {
        //     const http = new XMLHttpRequest()
        //
        //     http.open("GET", "/configUpdate?mName='" + typeName + "'")
        //     http.send()
        //     // http.onload = () => console.log(http.responseText)
        // }
    </script>
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
            $.get("config", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#name-txt").val(responseJson[0]);
                    $("#r-date-txt").val(responseJson[1]);
                    $("#rating-txt").val(responseJson[2]);
                    $("#desc-txt").val(responseJson[3]);
                    $("#fetch-img").attr('src',responseJson[4]);
                    // $("#mNameTxt").val(item);
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
</head>
<body>
<div class="tabs">
    <input type="button" data-tab-target="#add-m" class="active tab" value="Add Movies">
    <input type="button" data-tab-target="#pricing" class="tab" value="home">
    <input type="button" data-tab-target="#about" class="tab" value="home" >
<%--    onclick="sendRequestXe()"--%>
    <input type="button" data-tab-target="#abou" class="tab" value="home">
</div>

<div class="tab-content">
    <div class="panel" id="add-m" data-tab-content class="active">
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
                    <div class="rname">Genre:</div>
                    <div class="rtype"><input type="text"  class="mxmw" id="genre-txt" name="genre"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Rating:</div>
                    <div class="rtype"><input type="text" value="Year" class="mxmw"  id="rating-txt" name="rating"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Ticket Price:</div>
                    <div class="rtype"><input type="text" value="Year" class="mxmw" name="ticket-price"></div>
                </div>
                <div class="rowr btns">
                    <div class="rtype-btn"><input type="button" value="Fetch" id="btn-fetch" onclick="sendRequest(document.getElementsByName('mName')[0].value)"></div>
                    <div class="rtype-btn"><input type="reset" value="Reset" id="btn-reset"></div>
                    <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit"></div>
                </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Duration:</div>
                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="duration-txt" name="duration"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Description:</div>
<%--                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="desc-txt" name="description"></div>--%>
                    <div class="rtype"><textarea  id="desc-txt" name="description" cols="15" rows="7"></textarea></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype" ><input type="text" value="Year"  class="mxmw"  name="trailer_url"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file" value="Year" accept="image/*" class="img" name="file"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/Man-of-Steel-Character-Poster-Kal-El.jpg" class="dsp-img" id="fetch-img" alt="fetch-img">
                </div>
            </div>
            </form>
        </div>
    </div>




    <div class="panel" id="pricing" data-tab-content>
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
                        <div class="rname">Genre:</div>
                        <div class="rtype"><input type="text"  class="mxmw" id="genre-txt2" name="genre2"></div>
                    </div>
                    <div class="rowl">
                        <div class="rname">Rating:</div>
                        <div class="rtype"><input type="text" value="Year" class="mxmw"  id="rating-txt2" name="rating2"></div>
                    </div>
                    <div class="rowr">
                        <div class="rname">Ticket Price:</div>
                        <div class="rtype"><input type="text" value="Year" class="mxmw" id="tkt-txt" name="ticket-price2"></div>
                    </div>
                    <div class="rowr btns">
                        <div class="rtype-btn"><input type="button" value="Search" id="btn-search"></div>
                        <div class="rtype-btn"><input type="reset" value="Reset" id="btn-reset"></div>
                        <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit"></div>
                    </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Duration:</div>
                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="duration-txt2" name="duration2"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Description:</div>
                    <%--                    <div class="rtype"><input type="text" value="Year" class="mxmw" id="desc-txt" name="description"></div>--%>
                    <div class="rtype"><textarea  id="desc-txt2" name="description2" cols="15" rows="7"></textarea></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype" ><input type="text" value="Year"  class="mxmw" id="trailer-txt"  name="trailer_url2"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file" value="Year" accept="image/*" class="img" name="file2"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/Man-of-Steel-Character-Poster-Kal-El.jpg" class="dsp-img" id="search-img" alt="search-img">
                </div>
            </div>
            </form>
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

    <div class="panel" id="about" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                        <input type="text" name="text-uc-movie-nm" placeholder="Search..." class="text-uc-movie-search" id="text-uc-movie-id">
                        <input type="button" name="submit-uc-search" class="submit-uc-search-submit" value="Search" id="ucm-search-submit">
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span id="spn-id-uc">____</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span id="spn-name-uc">____________</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="configUM" method="get" name="add-form-uc">
                            <input type="hidden" name="AddReady" value="1">
                            <input type="submit" name="add-form-uc-submit" value="Add" class="add-form-uc-submit">
                        </form>
                    </div>
                </div>
            </div>

            <script>
                // $(document).on("click", "#dlt-btn1", function() {
                //     $.get("configUM?dltRec='"+document.getElementById('dsp-p1').textContent+"'", function(responseJson) {
                //         if(responseJson==="1"){
                //             window.alert("Record Deleted Successfully");
                //         }
                //         else{
                //             window.alert("Process Failed");
                //         }
                //     });
                // });

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

    <div class="panel" id="abou" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <form action="" method="post" name="form-um">
                        <input type="text" name="text-ns-movie" placeholder="Search..." class="text-uc-movie-search">
                        <input type="submit" name="submit-uc-search" class="submit-uc-search-submit" value="Search">
                    </form>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span>4000</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span>Insterstellar</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="" method="post" name="add-form-uc">
                            <input type="submit" name="add-form-uc-submit" value="Add" class="add-form-uc-submit">
                        </form>
                    </div>
                </div>
            </div>


            <div class="dsp-svd">
                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>

                <div class="dsp-uc-movie">
                    <div class="dsp-uc-inner"><p>1</p></div>
                    <div class="dsp-uc-inner"><p>Interstellar</p></div>
                    <div class="dsp-uc-inner"><p>2020-06-02</p></div>
                    <div class="dsp-uc-inner"><p>Sci-fi/Action</p></div>
                    <div class="dsp-uc-inner dsp-uc-inner-btn">
                        <button id="dlt-btn" >Delete</button>
                    </div>
                </div>


            </div>
        </div>
    </div>

</div>
</body>
</html>