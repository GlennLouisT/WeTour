<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en" id="book">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String verifiedAddPerson = (String) session.getAttribute("verifiedAddPerson");
        int personAdd = Integer.parseInt(verifiedAddPerson);
        String failBookDetailMessage = (String) session.getAttribute("failBookDetailMessage");
        Vector failBookName = new Vector();
        Vector failBookPassport = new Vector();
        Vector failBookGender = new Vector();
        Vector failBookAge = new Vector();
        Vector failBookSpecial = new Vector();
        
        if(failBookDetailMessage != null){
            failBookName = (Vector) session.getAttribute("failBookName");
            failBookPassport = (Vector) session.getAttribute("failBookPassport");
            failBookGender = (Vector) session.getAttribute("failBookGender");
            failBookAge = (Vector) session.getAttribute("failBookAge");
            failBookSpecial = (Vector) session.getAttribute("failBookSpecial");
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="bookDetail_content">
        <h1>Detail Pemesanan</h1>
        <form action="bookDetailController.jsp">
            <table>
                <tr class="bookDetail_add_row" id="bookDetail_add_row_header">
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_no">
                            <img src="assets/list.number@2x.png" alt="" class="bookDetail_add_icon">
                            <p>No</p>
                        </div>
                    </td>
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_name">
                            <img src="assets/person.fill@2x.png" alt="" class="bookDetail_add_icon">
                            <p>Nama Pengunjung</p>
                        </div>
                    </td>
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_passport">
                            <img src="assets/number.circle.fill@2x.png" alt="" class="bookDetail_add_icon">
                            <p>Nomor Paspor</p>
                        </div>
                    </td>
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_gender">
                            <img src="assets/person.2.fill@2x.png" alt="" class="bookDetail_add_icon">
                            <p>Jenis Kelamin</p>
                        </div>
                    </td>
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_age">
                            <img src="assets/figure.stand@2x.png" alt="" class="bookDetail_add_icon">
                            <p>Umur</p>
                        </div>
                    </td>
                    <td>
                        <div class="bookDetail_add_row_head" id="bookDetail_add_row_head_special">
                            <img src="assets/pills.fill@2x.png" alt="" class="bookDetail_add_icon">
                            <p>Kebutuhan Khusus</p>
                        </div>
                    </td>
                </tr>
                <%
                    for(int i = 0; i < personAdd; i++){
                %>
                <tr class="bookDetail_add_row">
                    <td>
                        <p id="bookDetail_add_row_content_no"><%=(i+1)%></p>
                    </td>
                    <td>
                        <input type="text" name="try_book_name_<%=(i+1)%>" style='text-transform:uppercase' id="bookDetail_add_row_content_name" placeholder="Nama <%=(i+1)%>" value="<%
                            if(failBookName.isEmpty()){
                                out.println("");
                            }
                            else{
                                out.println(failBookName.get(i));
                            }
                        %>">
                    </td>
                    <td>
                        <input type="text" name="try_book_passport_<%=(i+1)%>" id="bookDetail_add_row_content_passport" placeholder="No paspor <%=(i+1)%>" value="<%
                            if(failBookPassport.isEmpty()){
                                out.println("");
                            }
                            else{
                                out.println(failBookPassport.get(i));
                            }
                        %>">
                    </td>
                    <td>
                        <select name="try_book_gender_<%=(i+1)%>" id="bookDetail_add_row_content_gender">
                            <%-- <option> <%
                                if(!failBookGender.isEmpty()){
                                    String genderElement = (String) failBookGender.get(i);
                                    if(genderElement.equals("1")){
                                        out.println(genderElement);
                                    }
                                }
                            %> </option> --%>
                            <option value="-1" disabled <%
                                if(failBookGender.isEmpty()){
                                    out.println("selected");
                                }
                                else if(!failBookGender.isEmpty()){
                                    String genderElement = (String) failBookGender.get(i);
                                    if(genderElement == null){
                                        out.println("selected");
                                    }
                                }
                            %> >JENIS KELAMIN <%=(i+1)%></option>
                            <option value="1" <%
                                if(!failBookGender.isEmpty()){
                                    String genderElement = (String) failBookGender.get(i);
                                    if(genderElement == null){
                                        out.println("");
                                    }
                                    else if(genderElement.equals("1")){
                                        out.println("selected");
                                    }
                                }
                            %> >LAKI-LAKI</option>
                            <option value="2" <%
                                if(!failBookGender.isEmpty()){
                                    String genderElement = (String) failBookGender.get(i);
                                    if(genderElement == null){
                                        out.println("");
                                    }
                                    else if(genderElement.equals("2")){
                                        out.println("selected");
                                    }
                                }
                            %> >PEREMPUAN</option>
                            <option value="0" <%
                                if(!failBookGender.isEmpty()){
                                    String genderElement = (String) failBookGender.get(i);
                                    if(genderElement == null){
                                        out.println("");
                                    }
                                    else if(genderElement.equals("0")){
                                        out.println("selected");
                                    }
                                }
                            %> >LAINNYA</option>
                        </select>
                    </td>
                    <%
                        int failBookAgeRet;
                        if(failBookAge.isEmpty()){
                            failBookAgeRet = 0;
                        }
                        else{
                            String failBookAgeRetText = (String) failBookAge.get(i)
                            ;
                            if(failBookAgeRetText == ""){
                                failBookAgeRet = 0;
                            }
                            else{
                                failBookAgeRet = Integer.parseInt(failBookAgeRetText);
                            }
                        }
                    %>
                    <td>
                        <input type="number" name="try_book_age_<%=(i+1)%>" id="bookDetail_add_row_content_age" min="0" placeholder="Umur <%=(i+1)%>" value="<%=failBookAgeRet%>">
                    </td>
                    <td>
                        <input type="text" name="try_book_special_<%=(i+1)%>" id="bookDetail_add_row_content_special" placeholder="Kondisi khusus <%=(i+1)%>" value="<%
                            if(failBookSpecial.isEmpty()){
                                out.println("");
                            }
                            else{
                                out.println(failBookSpecial.get(i));
                            }
                        %>">
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <p id="bookDetail_form_error">
                <%
                    if(failBookDetailMessage != null){
                        out.println(failBookDetailMessage);
                        session.setAttribute("failBookDetailMessage", null);
                    }
                %>
            </p>
            <div id="bookDetail_content_action">
                <a href="index.jsp"><p>Batalkan</p></a>
                <button type="submit">Lanjut</button>
            </div>
        </form>
    </div>
    <script>
        window.addEventListener('scroll', function(){
            let value = window.scrollY;
            if(value >= 1){
                if(value * 0.005 < 0.5){
                    document.getElementById('navbar_nav').style.backgroundColor = "rgba(12, 16, 39, " + value * 0.005 + ")";
                }
                else{
                    document.getElementById('navbar_nav').style.backgroundColor = "rgba(12, 16, 39, 0.5)";
                }
            }
            else{
                document.getElementById('navbar_nav').style.backgroundColor = "rgba(0, 0, 0, 0)";
            }
        })
    </script>
</body>
</html>