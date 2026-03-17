class AnalysisException(Exception):
    """Raised when analysis fails (e.g., model inference error)."""
    def __init__(self, message: str = "Analysis failed"):
        self.message = message
        super().__init__(self.message)


class ModelLoadException(Exception):
    """Raised when an ML model cannot be loaded."""
    def __init__(self, message: str = "Model loading failed"):
        self.message = message
        super().__init__(self.message)


class ValidationException(Exception):
    """Raised when input validation fails beyond Pydantic checks."""
    def __init__(self, message: str = "Validation error"):
        self.message = message
        super().__init__(self.message)