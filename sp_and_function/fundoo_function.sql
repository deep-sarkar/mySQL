-- CREATE Function to return list of labels for a note
CREATE FUNCTION fn_get_labels(v_note_id int)
RETURNS varchar(2000) DETERMINISTIC
BEGIN
DECLARE v_label_name varchar(20);
DECLARE v_label_list varchar(2000) default '';
DECLARE v_finished integer default 0;
DECLARE get_all_label_cursor CURSOR FOR SELECT name 
        FROM label_label
        INNER JOIN note_labelmap
        ON label_label.id = note_labelmap.label_id
        WHERE note_labelmap.note_id = v_note_id ;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

OPEN get_all_label_cursor;

getLabels: LOOP
    FETCH get_all_label_cursor INTO v_label_name;
    if v_finished = 1
    THEN leave getLabels;
    END if;
    set v_label_list = concat(v_label_list , concat(v_label_name, ',' ));
END LOOP getLabels;
CLOSE get_all_label_cursor;
return concat('[', concat(v_label_list, ']'));
END$$
