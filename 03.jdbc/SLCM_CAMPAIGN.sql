CREATE TABLE SLCM_CAMPAIGN
(
    CAMPAIGN_ID NUMBER(12) PRIMARY KEY NOT NULL,
    EXTERNAL_CAMPAIGN_ID VARCHAR2(20) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE,
    COUNT_CONTROL NUMBER(5),
    CAMPAIGN_OPTION NUMBER(2) DEFAULT 0 NOT NULL,
    TYPE NUMBER(2) DEFAULT 0 NOT NULL,
    CAMPAIGN_NAME VARCHAR2(100) NOT NULL,
    DESCRIPTION VARCHAR2(500),
    CREATION_DATE TIMESTAMP(6) NOT NULL,
    MODIFICATION_DATE TIMESTAMP(6) NOT NULL,
    VERSION NUMBER(12) DEFAULT 0 NOT NULL
);
COMMENT ON COLUMN SLCM_CAMPAIGN.CAMPAIGN_OPTION IS '0 : schedule  1 : update';
COMMENT ON COLUMN SLCM_CAMPAIGN.TYPE IS '0 : non-recurring  1 : recurring';
CREATE UNIQUE INDEX AK_CAMPAIGN ON SLCM_CAMPAIGN (EXTERNAL_CAMPAIGN_ID);