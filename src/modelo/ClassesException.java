package modelo;
public class ClassesException extends Exception
{
		private static final long serialVersionUID = 1L;

		public ClassesException() 
		{
			super();
		}
		public ClassesException(String message, Throwable cause) 
		{
			super(message, cause);
		}

		public ClassesException(String message) 
		{
			super(message);
		}

		public ClassesException(Throwable cause) 
		{
			super(cause);
		}
}
