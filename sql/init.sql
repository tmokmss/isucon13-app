
CREATE INDEX `index_userid` ON `icons` (`user_id`);
CREATE INDEX `index_userid` ON `themes` (`user_id`);
CREATE INDEX `index_userid` ON `livestreams` (`user_id`);
CREATE INDEX `index_start_end` ON `reservation_slots` (`start_at`, `end_at`);
CREATE INDEX `index_lsid_tip` ON `livecomments` (`livestream_id`, `tip`);
CREATE INDEX `index_lsid` ON `livestream_tags` (`livestream_id`);
CREATE INDEX `index_user_id_lsid_word` ON `ng_words` (`user_id`, `livestream_id`, `word`);
CREATE INDEX `index_lsid_createdat` ON `reactions` (`livestream_id`, `created_at` DESC);
CREATE FULLTEXT INDEX `index_comment` ON `livecomments` (`comment`);