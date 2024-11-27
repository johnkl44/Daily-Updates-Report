ALTER PROCEDURE SP_CURDOPERATIONS(
    @id             INT = NULL,
    @FirstName      VARCHAR(255) = NULL,
    @LastName       VARCHAR(255) = NULL,
    @BirthDate      DATETIME = NULL,
    @Age            INT = NULL,
    @Gender         VARCHAR(255) = NULL,
    @PhoneNumber    VARCHAR(255) = NULL,
    @EmailAddress   VARCHAR(255) = NULL,
    @City           VARCHAR(155) = NULL,
    @Password_hash  VARCHAR(255) = NULL,
    @StatementType  NVARCHAR(20) = ''
)
AS
BEGIN
    BEGIN TRY
        IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO tblRegister (
                FirstName,
                LastName,
                BirthDate,
                Age,
                Gender,
                PhoneNumber,
                EmailAddress,
                City,
                Password_hash
            )
            VALUES (
                @FirstName,
                @LastName,
                @BirthDate,
                @Age,
                @Gender,
                @PhoneNumber,
                @EmailAddress,
                @City,
                @Password_hash
            );
        END
        ELSE IF @StatementType = 'Select'
        BEGIN
            IF @EmailAddress IS NOT NULL
            BEGIN
                SELECT *
                FROM tblRegister
                WHERE EmailAddress = @EmailAddress;
            END
            ELSE
            BEGIN
                SELECT *
                FROM tblRegister;
            END
        END
        ELSE IF @StatementType = 'Update'
        BEGIN
            UPDATE tblRegister
            SET
                FirstName = @FirstName,
                LastName = @LastName,
                BirthDate = @BirthDate,
                Age = @Age,
                Gender = @Gender,
                PhoneNumber = @PhoneNumber,
                EmailAddress = @EmailAddress,
                City = @City,
                Password_hash = @Password_hash
            WHERE EmployeeID = @id;
        END
        ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM tblRegister
            WHERE EmployeeID = @id;
        END
        ELSE
        BEGIN
            PRINT 'Invalid StatementType. Please specify Insert, Select, Update, or Delete.';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;





EXEC SP_CURDOPERATIONS @StatementType = 'Select';

EXEC SP_CURDOPERATIONS @StatementType = 'Insert';

EXEC SP_CURDOPERATIONS @StatementType = 'Update';

EXEC SP_CURDOPERATIONS @StatementType = 'Delete';

EXEC SP_CURDOPERATIONS @id = 8, @StatementType = 'Delete';
