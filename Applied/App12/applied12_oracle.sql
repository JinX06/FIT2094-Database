SELECT
    JSON_OBJECT(
      '_id'           VALUE stuid,
      'name'          VALUE stufname || ' ' || stulname,
      'contactInfo'   VALUE JSON_OBJECT(
                          'address' VALUE stuaddress,
                          'phone'   VALUE RTRIM(stuphone),
                          'email'   VALUE stuemail
                        ),
      'dob'           VALUE TO_CHAR(studob, 'dd-mm-yyyy'),
      'enrolmentInfo' VALUE JSON_ARRAYAGG(
                          JSON_OBJECT(
                            'unitcode'  VALUE unitcode,
                            'unitname'  VALUE unitname,
                            'year'      VALUE TO_CHAR(ofyear, 'yyyy'),
                            'semester'  VALUE ofsemester,
                            'mark'      VALUE enrolmark,
                            'grade'     VALUE enrolgrade
                          )
                        ) 
                        FORMAT JSON)
    || ','
FROM
    uni.student
    NATURAL JOIN uni.enrolment
    NATURAL JOIN uni.unit
GROUP BY
    stuid,
    stufname,
    stulname,
    stuaddress,
    stuphone,
    stuemail,
    studob
ORDER BY
    stuid;
