package bitcamp.assignment.service;

@SuppressWarnings("serial")
public class MemberNotFoundException extends RuntimeException
{
    public MemberNotFoundException(String message)
    {
        super(message);
    }
}