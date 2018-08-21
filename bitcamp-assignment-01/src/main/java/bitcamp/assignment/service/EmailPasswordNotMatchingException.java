package bitcamp.assignment.service;

@SuppressWarnings("serial")
public class EmailPasswordNotMatchingException extends RuntimeException
{
    public EmailPasswordNotMatchingException(String message)
    {
        super(message);
    }
}