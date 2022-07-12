<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String verifiedAddPerson = (String) session.getAttribute("verifiedAddPerson");
    int personAdd = Integer.parseInt(verifiedAddPerson);

    Vector tryBookName = new Vector(personAdd);
    Vector tryBookPassport = new Vector(personAdd);
    Vector tryBookGender = new Vector(personAdd);
    Vector tryBookAge = new Vector(personAdd);
    Vector tryBookSpecial = new Vector(personAdd);

    Boolean fail = false;
    String failBookDetailMessage = "";

    tryBookName.setSize(personAdd);
    tryBookPassport.setSize(personAdd);
    tryBookGender.setSize(personAdd);
    tryBookAge.setSize(personAdd);
    tryBookSpecial.setSize(personAdd);

    switch(personAdd){
        case 10:
            tryBookName.set(9, request.getParameter("try_book_name_10"));
            tryBookPassport.set(9, request.getParameter("try_book_passport_10"));
            tryBookGender.set(9, request.getParameter("try_book_gender_10"));
            tryBookAge.set(9, request.getParameter("try_book_age_10"));
            tryBookSpecial.set(9, request.getParameter("try_book_special_10"));
        case 9: 
            tryBookName.set(8,request.getParameter("try_book_name_9"));
            tryBookPassport.set(8, request.getParameter("try_book_passport_9"));
            tryBookGender.set(8, request.getParameter("try_book_gender_9"));
            tryBookAge.set(8, request.getParameter("try_book_age_9"));
            tryBookSpecial.set(8, request.getParameter("try_book_special_9"));
        case 8: 
            tryBookName.set(7,request.getParameter("try_book_name_8"));
            tryBookPassport.set(7, request.getParameter("try_book_passport_8"));
            tryBookGender.set(7, request.getParameter("try_book_gender_8"));
            tryBookAge.set(7, request.getParameter("try_book_age_8"));
            tryBookSpecial.set(7, request.getParameter("try_book_special_8"));
        case 7: 
            tryBookName.set(6,request.getParameter("try_book_name_7"));
            tryBookPassport.set(6, request.getParameter("try_book_passport_7"));
            tryBookGender.set(6, request.getParameter("try_book_gender_7"));
            tryBookAge.set(6, request.getParameter("try_book_age_7"));
            tryBookSpecial.set(6, request.getParameter("try_book_special_7"));
        case 6: 
            tryBookName.set(5,request.getParameter("try_book_name_6"));
            tryBookPassport.set(5, request.getParameter("try_book_passport_6"));
            tryBookGender.set(5, request.getParameter("try_book_gender_6"));
            tryBookAge.set(5, request.getParameter("try_book_age_6"));
            tryBookSpecial.set(5, request.getParameter("try_book_special_6"));
        case 5: 
            tryBookName.set(4,request.getParameter("try_book_name_5"));
            tryBookPassport.set(4, request.getParameter("try_book_passport_5"));
            tryBookGender.set(4, request.getParameter("try_book_gender_5"));
            tryBookAge.set(4, request.getParameter("try_book_age_5"));
            tryBookSpecial.set(4, request.getParameter("try_book_special_5"));
        case 4: 
            tryBookName.set(3,request.getParameter("try_book_name_4"));
            tryBookPassport.set(3, request.getParameter("try_book_passport_4"));
            tryBookGender.set(3, request.getParameter("try_book_gender_4"));
            tryBookAge.set(3, request.getParameter("try_book_age_4"));
            tryBookSpecial.set(3, request.getParameter("try_book_special_4"));
        case 3: 
            tryBookName.set(2,request.getParameter("try_book_name_3"));
            tryBookPassport.set(2, request.getParameter("try_book_passport_3"));
            tryBookGender.set(2, request.getParameter("try_book_gender_3"));
            tryBookAge.set(2, request.getParameter("try_book_age_3"));
            tryBookSpecial.set(2, request.getParameter("try_book_special_3"));
        case 2:
            tryBookName.set(1,request.getParameter("try_book_name_2"));
            tryBookPassport.set(1, request.getParameter("try_book_passport_2"));
            tryBookGender.set(1, request.getParameter("try_book_gender_2"));
            tryBookAge.set(1, request.getParameter("try_book_age_2"));
            tryBookSpecial.set(1, request.getParameter("try_book_special_2"));
        case 1:
            tryBookName.set(0,request.getParameter("try_book_name_1"));
            tryBookPassport.set(0, request.getParameter("try_book_passport_1"));
            tryBookGender.set(0, request.getParameter("try_book_gender_1"));
            tryBookAge.set(0, request.getParameter("try_book_age_1"));
            tryBookSpecial.set(0, request.getParameter("try_book_special_1"));
    }

    out.println(tryBookName);
    out.println(tryBookPassport);
    out.println(tryBookGender);
    out.println(tryBookAge);
    out.println(tryBookSpecial);
    out.println(personAdd);

    for(int i = 0; i < personAdd; i++){
        String tryBookNameTemp = (String) tryBookName.get(i);
        String tryBookPassportTemp = (String) tryBookPassport.get(i);
        String tryBookGenderTemp = (String) tryBookGender.get(i);
        String tryBookAgeTemp = (String) tryBookAge.get(i);
        String tryBookSpecialTemp = (String) tryBookSpecial.get(i);
        if(tryBookNameTemp.isEmpty()){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + "Nama" + (i+1) + " belum diisi <br>";
        }
        else if(!tryBookNameTemp.matches("[a-zA-Z ]+")){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + "Nama " + tryBookNameTemp + " harus terdiri dari karakter <br>";
        }
        else if(!tryBookNameTemp.matches("[a-zA-Z ]+")){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + "Nama " + tryBookNameTemp + " harus terdiri dari karakter <br>";
        }
        else if(tryBookPassportTemp.isEmpty()){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + tryBookNameTemp + " belum memasukkan nomor paspor <br>";
        }
        else if(tryBookPassportTemp.length() < 7 || tryBookPassportTemp.length() > 8){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + "Panjang nomor paspor " + tryBookNameTemp + " tidak valid (panjang nomor paspor antara 7 atau 8 karakter) <br>";
        }
        else if(!tryBookPassportTemp.matches("[A-Za-z][0-9]+")){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + "Nomor paspor " + tryBookNameTemp + " tidak valid (nomor paspor memiliki format 'X123456' atau 'X1234567') <br>";
        }
        else if(tryBookGenderTemp == null){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + tryBookNameTemp + " belum memilih jenis kelamin <br>";
        }
        else if(tryBookAgeTemp.isEmpty()){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + tryBookNameTemp + " belum memasukkan umur <br>";
        }
        else if(Integer.parseInt(tryBookAgeTemp) < 13){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + tryBookNameTemp + " tidak dapat melakukan kunjungan karena berusia dibawah 13 tahun <br>";
        }
        else if(Integer.parseInt(tryBookAgeTemp) > 65){
            fail = true;
            failBookDetailMessage = failBookDetailMessage + tryBookNameTemp + " tidak dapat melakukan kunjungan karena berusia diatas 65 tahun <br>";
        }
    }
    out.println(failBookDetailMessage);
    if(fail == true){
        session.setAttribute("failBookName", tryBookName);
        session.setAttribute("failBookPassport", tryBookPassport);
        session.setAttribute("failBookGender", tryBookGender);
        session.setAttribute("failBookAge", tryBookAge);
        session.setAttribute("failBookSpecial", tryBookSpecial);
        session.setAttribute("failBookDetailMessage", failBookDetailMessage);
        response.sendRedirect("bookDetail.jsp");
    }
    else{
        session.setAttribute("payBookPerson", personAdd);
        session.setAttribute("payBookName", tryBookName);
        session.setAttribute("payBookPassport", tryBookPassport);
        session.setAttribute("payBookGender", tryBookGender);
        session.setAttribute("payBookAge", tryBookAge);
        session.setAttribute("payBookSpecial", tryBookSpecial);
        response.sendRedirect("bookPayment.jsp");
    }
%>