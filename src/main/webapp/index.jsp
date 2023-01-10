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
    </script>
    <script>
        $(document).on("click", "#btn-fetch", function() {
            $.get("config", function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#name-txt").val(responseJson[0]);
                    $("#r-date-txt").val(responseJson[1]);
                    $("#rating-txt").val(responseJson[2]);
                    $("#desc-txt").val(responseJson[3]);
                    console.log(responseJson[0]);
                    // $("#mNameTxt").val(item);
                });
            });
        });
    </script>
</head>
<body>
<div class="tabs">
    <input type="button" data-tab-target="#add-m" class="active tab" value="Add Movies">
    <input type="button" data-tab-target="#pricing" class="tab" value="home">
    <input type="button" data-tab-target="#about" class="tab" value="home">
    <input type="button" data-tab-target="#abou" class="tab" value="home">
</div>

<div class="tab-content">
    <div class="panel" id="add-m" data-tab-content class="active">
        <div class="inner-panel">
            <div class="left-panel">
                <div class="rowl">
                    <div class="rname">Movie Name:</div>
                    <div class="rtype"><input type="text" value="Name" class="txt" id="name-txt" name="mName"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Release Date:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="r-date-txt" name="release-date"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Genre:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="genre-txt" name="genre"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Rating:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="rating-txt" name="rating"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Ticket Price:</div>
                    <div class="rtype"><input type="text" value="Year" name="ticket price"></div>
                </div>
                <div class="rowr btns">
                    <div class="rtype-btn"><input type="button" value="Fetch" id="btn-fetch" onclick="sendRequest(document.getElementsByName('mName')[0].value)"></div>
                    <div class="rtype-btn"><input type="button" value="Reset" id="btn-reset"></div>
                    <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit"></div>
                </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Duration:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="duration-txt" name="duration"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Description:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="desc-txt" name="description"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype"><input type="text" value="Year" class="txt" id="mxmw"   name="trailer_url"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file" value="Year" accept="image/*" class="img" name="img"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/Man-of-Steel-Character-Poster-Kal-El.jpg" class="dsp-img" id="fetch-img" alt="fetch-img">
                </div>
            </div>
        </div>
    </div>




    <div class="panel" id="pricing" data-tab-content>
        <div class="inner-panel">
            <div class="left-panel">
                <div class="rowl">
                    <div class="rname">Movie Name:</div>
                    <div class="rtype"><input type="text" value="Name" id="txt" name="Name"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Release Date:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="release-date"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Genre:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="genre"></div>
                </div>
                <div class="rowl">
                    <div class="rname">Rating:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="rating"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Ticket Price:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="ticket price"></div>
                </div>
                <div class="rowr btns">
                    <div class="rtype-btn"><input type="button" value="Fetch" id="btn-fetch1"></div>
                    <div class="rtype-btn"><input type="button" value="Reset" id="btn-reset"></div>
                    <div class="rtype-btn"><input type="submit" value="Submit" id="btn-submit"></div>
                </div>
            </div>
            <div class="right-panel">
                <div class="rowr">
                    <div class="rname">Duration:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="duration"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Description:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="description"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Trailer Url:</div>
                    <div class="rtype"><input type="text" value="Year" id="txt" name="trailer_url"></div>
                </div>
                <div class="rowr">
                    <div class="rname">Image:</div>
                    <div class="rtype"><input type="file" value="Year" accept="image/*" id="img" name="img"></div>
                </div>
                <div class="rowr div-img">
                    <img src="img/Man-of-Steel-Character-Poster-Kal-El.jpg" class="dsp-img" alt="fetch-img">
                </div>
            </div>
        </div>
    </div>




    <div class="panel" id="about" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <form action="" method="post" name="form-um" id="form-um-id">
                        <input type="text" name="text-uc-movie" placeholder="Search..." id="text-uc-movie-search">
                        <input type="submit" name="submit-uc-search" id="submit-uc-search-submit" value="Search">
                    </form>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span>4000</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span>Insterstellar</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="" method="post" name="add-form-uc">
                            <input type="submit" name="add-form-uc-submit" value="Add" id="add-form-uc-submit">
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
            </div>
        </div>
    </div>

    <div class="panel" id="abou" data-tab-content>
        <div class="inner-panel-upcoming-m">
            <div class="add-uc-movie">
                <div class="uc-search">
                    <form action="" method="post" name="form-um" id="form-um-id">
                        <input type="text" name="text-uc-movie" placeholder="Search..." id="text-uc-movie-search">
                        <input type="submit" name="submit-uc-search" id="submit-uc-search-submit" value="Search">
                    </form>
                </div>
                <div class="add-uc">
                    <div class="add-uc-text-div-id"><p>ID : <span>4000</span></p></div>
                    <div class="add-uc-text-div"><p>Name : <span>Insterstellar</span></p></div>
                    <div class="add-form-uc-div">
                        <form action="" method="post" name="add-form-uc">
                            <input type="submit" name="add-form-uc-submit" value="Add" id="add-form-uc-submit">
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