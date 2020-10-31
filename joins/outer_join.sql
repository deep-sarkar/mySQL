-- RIGHT OUTER JOIN
SELECT title, color, image , username
FROM note_note 
RIGHT OUTER JOIN auth_user 
ON note_note.user_id = auth_user.id;

-- LEFT OUTER JOIN
SELECT name, title, color
FROM note_note
LEFT OUTER JOIN note_labelmap
ON note_note.id = note_labelmap.note_id
RIGHT JOIN label_label
ON label_label.id = note_labelmap.label_id;

-- FULL OUTER JOIN
SELECT name, username
FROM label_label
LEFT OUTER JOIN auth_user
ON label_label.user_id = auth_user.id
UNION
SELECT name, username
FROM label_label
RIGHT OUTER JOIN auth_user
ON label_label.user_id = auth_user.id;