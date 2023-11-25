TRUNCATE TABLE themes;
TRUNCATE TABLE icons;
TRUNCATE TABLE reservation_slots;
TRUNCATE TABLE livestream_viewers_history;
TRUNCATE TABLE livecomment_reports;
TRUNCATE TABLE ng_words;
TRUNCATE TABLE reactions;
TRUNCATE TABLE tags;
TRUNCATE TABLE livestream_tags;
TRUNCATE TABLE livecomments;
TRUNCATE TABLE livestreams;
TRUNCATE TABLE users;

ALTER TABLE `themes` auto_increment = 1;
ALTER TABLE `icons` auto_increment = 1;
ALTER TABLE `reservation_slots` auto_increment = 1;
ALTER TABLE `livestream_tags` auto_increment = 1;
ALTER TABLE `livestream_viewers_history` auto_increment = 1;
ALTER TABLE `livecomment_reports` auto_increment = 1;
ALTER TABLE `ng_words` auto_increment = 1;
ALTER TABLE `reactions` auto_increment = 1;
ALTER TABLE `tags` auto_increment = 1;
ALTER TABLE `livecomments` auto_increment = 1;
ALTER TABLE `livestreams` auto_increment = 1;
ALTER TABLE `users` auto_increment = 1;

DROP INDEX `index_userid` ON `icons`;
DROP INDEX `index_userid` ON `themes`;
DROP INDEX `index_userid` ON `livestreams`;
DROP INDEX `index_start_end` ON `reservation_slots`;
DROP INDEX `index_lsid_tip` ON `livecomments`;
DROP INDEX `index_lsid` ON `livestream_tags`;
DROP INDEX `index_user_id_lsid_word` ON `ng_words`;
DROP INDEX `index_lsid_createdat` ON `reactions`;

CREATE INDEX `index_userid` ON `icons` (`user_id`);
CREATE INDEX `index_userid` ON `themes` (`user_id`);
CREATE INDEX `index_userid` ON `livestreams` (`user_id`);
CREATE INDEX `index_start_end` ON `reservation_slots` (`start_at`, `end_at`);
CREATE INDEX `index_lsid_tip` ON `livecomments` (`livestream_id`, `tip`);
CREATE INDEX `index_lsid` ON `livestream_tags` (`livestream_id`);
CREATE INDEX `index_user_id_lsid_word` ON `ng_words` (`user_id`, `livestream_id`, `word`);
CREATE INDEX `index_lsid_createdat` ON `reactions` (`livestream_id`, `created_at` DESC);


ALTER TABLE icons DROP icon_hash;
ALTER TABLE icons ADD icon_hash varchar(255);
