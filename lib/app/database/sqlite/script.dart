final createTable = ''' 
  CREATE TABLE contact(
    id INT PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
  )
''';

final insert1 = ''' 
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES('Carlos','(+244) 963 223 233','carlos@gmail.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png')
''';

final insert2 = ''' 
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES('Maria','(+244) 982 234 245','maria@gmail.com','https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_1280.png')
''';

final insert3 = ''' 
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES('Filomena','(+244) 913 456 231','filomena@gmail.com','https://cdn.pixabay.com/photo/2021/01/06/10/10/woman-5893922_1280.jpg')
''';
