-- Display notes for user admin
SELECT title, color
FROM note_note n
WHERE user_id = (
    SELECT id 
    FROM auth_user 
    WHERE username = 'admin'
);





-- Display notes have 'blue' label in it for user admin
SELECT title, note_note.user_id, label_label.name 
FROM note_note
INNER JOIN note_labelmap
ON note_note.id = note_labelmap.note_id
INNER JOIN label_label
ON label_label.id = note_labelmap.label_id
WHERE label_label.id = (
    SELECT id 
    FROM label_label
    WHERE name = 'blue' and user_id = (
        SELECT id
        FROM auth_user
        WHERE username = 'admin'
    )
);