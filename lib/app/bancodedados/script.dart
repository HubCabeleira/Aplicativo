final createTable = '''
  CREATE TABLE contact(
    id INT NOT NULL PRIMARY KEY
    ,nomes VARCHAR(100) NOT NULL
    ,numeros CHAR(18) NOT NULL
    ,email VARCHAR(200) NOT NULL
    ,linkAvatar VARCHAR(300) NOT NULL 
  )
''';

final insert1 = '''
INSERT INTO contact (nomes, numeros, email, linkAvatar)
VALUES ('Polícia Militar', '190', 'policiamilitar@hotmail.com','https://alagoasdigital.al.gov.br/uploads/admin/organ/attachment/5975e72b8c36c75066f557f5/xpmal.png.pagespeed.ic.O6R4F-cqsa.png')
''';

final insert2 = '''
INSERT INTO contact (nomes, numeros, email, linkAvatar)
VALUES ('Polícia Civil','197', 'policiacivil@hotmail.com','https://pbs.twimg.com/profile_images/1052552855704489984/TNAdWnIR.jpg')
''';

final insert3 = '''
INSERT INTO contact (nomes, numeros, email, linkAvatar)
VALUES ('Samu','192','samu@hotmail.com','https://i.pinimg.com/550x/3c/f0/f7/3cf0f76ada24bd0ae332210f91e70747.jpg'
)
''';
