final createTable = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY
    ,nomes VARCHAR(100) NOT NULL
    ,numeros CHAR(16) NOT NULL
    ,email VARCHAR(200) NOT NULL
    ,link_avatar VARCHAR(300) NOT NULL 
  )
''';

final insert1 = '''
INSERT INTO contact (nomes, numeros, email, link_avatar)
VALUES ('Polícia Militar', '190', 'policiamilitar@hotmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiWwQDooqyRspzkDug7Y-4Wkvlj8IIruQ9mAFDAmEKXMQW_AS-8zSsEIuhoaqVCGIU9cg&usqp=CAU')
''';

final insert2 = '''
INSERT INTO contact(nomes, numeros, email, link_avatar)
VALUES ('Polícia Civil','197', 'policiacivil@hotmail.com','https://pbs.twimg.com/profile_images/1052552855704489984/TNAdWnIR.jpg')
''';

final insert3 = '''
INSERT INTO contact (nomes, numeros, email, link_avatar)
VALUES ('Samu','192','samu@hotmail.com','https://i.pinimg.com/550x/3c/f0/f7/3cf0f76ada24bd0ae332210f91e70747.jpg')
''';
