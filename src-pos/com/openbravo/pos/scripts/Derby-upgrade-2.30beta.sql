--    Openbravo POS is a point of sales application designed for touch screens.
--    Copyright (C) 2009 Openbravo, S.L.
--    http://sourceforge.net/projects/openbravopos
--
--    This file is part of Openbravo POS.
--
--    Openbravo POS is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    Openbravo POS is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.

-- Database upgrade script for DERBY

-- v2.30beta - v2.35

ALTER TABLE ATTRIBUTEVALUE DROP CONSTRAINT ATTVAL_ATT;
ALTER TABLE ATTRIBUTEVALUE ADD CONSTRAINT ATTVAL_ATT FOREIGN KEY (ATTRIBUTE_ID) REFERENCES ATTRIBUTE(ID) ON DELETE CASCADE;

ALTER TABLE ATTRIBUTEUSE DROP CONSTRAINT ATTUSE_SET;
ALTER TABLE ATTRIBUTEUSE ADD CONSTRAINT ATTUSE_SET FOREIGN KEY (ATTRIBUTESET_ID) REFERENCES ATTRIBUTESET(ID) ON DELETE CASCADE;

ALTER TABLE ATTRIBUTESETINSTANCE DROP CONSTRAINT ATTSETINST_SET;
ALTER TABLE ATTRIBUTESETINSTANCE ADD CONSTRAINT ATTSETINST_SET FOREIGN KEY (ATTRIBUTESET_ID) REFERENCES ATTRIBUTESET(ID) ON DELETE CASCADE;

ALTER TABLE ATTRIBUTEINSTANCE DROP CONSTRAINT ATTINST_SET;
ALTER TABLE ATTRIBUTEINSTANCE ADD CONSTRAINT ATTINST_SET FOREIGN KEY (ATTRIBUTESETINSTANCE_ID) REFERENCES ATTRIBUTESETINSTANCE(ID) ON DELETE CASCADE;

ALTER TABLE PRODUCTS ALTER COLUMN ISCOM DEFAULT 0;
ALTER TABLE PRODUCTS ALTER COLUMN ISSCALE DEFAULT 0;
ALTER TABLE TAXES ALTER COLUMN RATECASCADE DEFAULT 0;
ALTER TABLE CUSTOMERS ALTER COLUMN VISIBLE DEFAULT 1;

-- v2.30 - v2.30.1

ALTER TABLE TAXES ADD COLUMN VALIDFROM TIMESTAMP DEFAULT '2000-01-01 00:00:00' NOT NULL;

-- v2.30.1 - v2.30.2

-- final script

DELETE FROM SHAREDTICKETS;

UPDATE APPLICATIONS SET NAME = $APP_NAME{}, VERSION = $APP_VERSION{} WHERE ID = $APP_ID{};
