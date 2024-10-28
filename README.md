# Risky Business

here is some text




```plantUML
@startuml
' uncomment the line below if you're using computer with a retina display
' skinparam dpi 300
!define Table(name,desc) class name as "desc" << (T,#FFAAAA) >>
' we use bold for primary key
' green color for unique
' and underscore for not_null
!define primary_key(x) <b>x</b>
!define unique(x) <color:green>x</color>
!define not_null(x) <u>x</u>
' other tags available:
' <i></i>
' <back:COLOR></color>, where color is a color name or html color code
' (#FFAACC)
' see: http://plantuml.com/classes.html#More
hide methods
hide stereotypes

' entities

Table(user, "user\n(User in our system)") {
primary_key(id) INTEGER
not_null(unique(username)) VARCHAR[32]
not_null(password) VARCHAR[64]
}

Table(session, "session\n(session for user)") {
primary_key(id) INTEGER
not_null(user_id) INTEGER
not_null(unique(session_id)) VARCHAR[64]
}

Table(user_profile, "user_profile\n(Some info of user)") {
primary_key(user_id) INTEGER
age SMALLINT
gender SMALLINT
birthday DATETIME
}

Table(group, "group\n(group of users)") {
primary_key(id) INTEGER
not_null(name) VARCHAR[32]
}

Table(user_group, "user_group\n(relationship of user and group)") {
primary_key(user_id) INTEGER
primary_key(group_id) INTEGER
joined_at DATETIME
}

' relationships
' one-to-one relationship
user -- user_profile : "A user only \nhas one profile"
' one to may relationship
user --> session : "A user may have\n many sessions"
' many to many relationship
' Add mark if you like
user "1" --> "*" user_group : "A user may be \nin many groups"
group "1" --> "0..N" user_group : "A group may \ncontain many users"
@enduml
 
example.svg
Loading
template.puml
@startuml
' uncomment the line below if you're using computer with a retina display
' skinparam dpi 300
!define Table(name,desc) class name as "desc" << (T,#FFAAAA) >>
' we use bold for primary key
' green color for unique
' and underscore for not_null
!define primary_key(x) <b>x</b>
!define unique(x) <color:green>x</color>
!define not_null(x) <u>x</u>
' other tags available:
' <i></i>
' <back:COLOR></color>, where color is a color name or html color code
' (#FFAACC)
' see: http://plantuml.com/classes.html#More
hide methods
hide stereotypes

' entities

' relationships

@enduml
@tim-rohrer
tim-rohrer commented on Dec 3, 2017 • 
Nice!

I'm researching, but is there a way to add lengths to the field types? For example, CHAR(2)? I realize could do something like CHAR-2, but it would be nice to put them in parens.

Also, I'm experimenting with foreign keys...

@Potherca
Potherca commented on Mar 9, 2018
@tim-rohrer You could use:

!define VARCHAR(x) <color:gray>VARCHAR(x)</color>

@olgapshen
olgapshen commented on Mar 22, 2018 • 
if "desc" - will omit quotes it will break NetBeans plugin, but if descriptions in Tables will omit quotes it will works both on CLI and NetBeans.
https://stackoverflow.com/questions/49423335/sintax-error-in-plantuml

@ityoung
ityoung commented on Feb 18, 2019
Nice work!

@NewAlexandria
NewAlexandria commented on Mar 3, 2019
You can show one-to-many relations using the more-common 'bird foot' line notation, supported in plantUML now:

user "1" *--+ "many" user_group : has many groups through >
@QuantumGhost
Author
QuantumGhost commented on Aug 29, 2019
You can show one-to-many relations using the more-common 'bird foot' line notation, supported in plantUML now:

user "1" *--+ "many" user_group : has many groups through >
Nice!

@pavelvrublevskij
pavelvrublevskij commented on Oct 7, 2019 • 
Please fix 30 line:
not_null(unique(session_id) VARCHAR[64]
to
not_null(unique(session_id)) VARCHAR[64]

@QuantumGhost
Author
QuantumGhost commented on Oct 10, 2019
@pavelvrublevskij Fixed. Thanks for mentioning.

@xinyifly
xinyifly commented on May 13, 2020
Have you gave Information Engineering notation a try? https://plantuml.com/ie-diagram

@ItalicIntegral
Comment
 
Leave a comment
 
Footer
© 2024 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact
Manage cookies
Do not share my personal information

```