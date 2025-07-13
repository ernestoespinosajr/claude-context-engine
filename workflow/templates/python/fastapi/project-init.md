# Feature Template: Python FastAPI Project Initialization

## Applicability
- **Use when**: Starting a new Python FastAPI project
- **Language**: Python 3.9+
- **Framework**: FastAPI with SQLAlchemy and Pydantic
- **Platform**: Web API/Microservice

## Context Engineering Layers

### Layer 1: System Instructions
```
You are a Python FastAPI development specialist.
- Follow Python PEP standards and best practices
- Use type hints throughout for better code quality
- Implement async/await patterns for optimal performance
- Follow FastAPI conventions and patterns
- Use SQLAlchemy for database operations
- Implement proper error handling and validation
- Focus on API performance and scalability
```

### Layer 2: Goals
```
Feature: Python FastAPI Project Initialization
Primary Objective: Create a production-ready FastAPI project foundation
Success Criteria:
- FastAPI server runs and responds to requests
- Database integration is working
- API documentation is auto-generated
- Authentication system is set up
- Testing framework is configured
Quality Targets:
- API response time: <100ms for simple endpoints
- Code coverage: >90%
- Zero type checking errors with mypy
- Proper logging and monitoring setup
```

### Layer 3: Constraints
```
Technical Constraints:
- Python version: 3.9+ (recommended 3.11+)
- FastAPI version: 0.100+
- SQLAlchemy: 2.0+
- Pydantic: 2.0+
- Database: PostgreSQL (production), SQLite (development)
- Testing: pytest + httpx for async testing
- ASGI server: Uvicorn for development, Gunicorn for production
```

### Layer 4: Historical Context
```
FastAPI Project Patterns:
- SQLAlchemy 1.4 to 2.0 migration patterns
- Pydantic v1 to v2 migration best practices
- Async/await adoption in Python ecosystem
- API versioning strategies
- Microservice architecture patterns
- Docker containerization best practices
```

### Layer 5: External Context
```
FastAPI Documentation:
- Official FastAPI docs (fastapi.tiangolo.com)
- SQLAlchemy 2.0 docs (docs.sqlalchemy.org)
- Pydantic v2 docs (docs.pydantic.dev)
- Python typing docs (docs.python.org/3/library/typing.html)

Essential Libraries:
- fastapi: Modern, fast web framework
- sqlalchemy: SQL toolkit and ORM
- pydantic: Data validation using Python type hints
- uvicorn: ASGI server for development
- alembic: Database migrations
```

### Layer 6: Domain Knowledge
```
Python/FastAPI Best Practices:
- Project structure and organization
- Async/await patterns and performance
- Database design and ORM usage
- API design and RESTful principles
- Error handling and exception management
- Testing strategies for async code
- Security and authentication patterns
```

## Implementation Blueprint

### Phase 1: Project Setup & Environment
**Objective**: Create and configure the Python FastAPI project foundation

**Tasks**:
1. **Initialize Python Project**
   ```bash
   # Create project directory
   mkdir my-fastapi-project
   cd my-fastapi-project
   
   # Set up virtual environment
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   
   # Upgrade pip
   pip install --upgrade pip
   ```

2. **Install Dependencies**
   ```bash
   # Core dependencies
   pip install fastapi uvicorn sqlalchemy psycopg2-binary alembic
   pip install pydantic python-jose[cryptography] passlib[bcrypt]
   pip install python-multipart  # For file uploads
   
   # Development dependencies
   pip install pytest pytest-asyncio httpx black isort mypy
   pip install pre-commit flake8 bandit safety
   
   # Create requirements files
   pip freeze > requirements.txt
   ```

3. **Project Structure Setup**
   ```
   my-fastapi-project/
   ├── app/
   │   ├── __init__.py
   │   ├── main.py              # FastAPI application
   │   ├── config.py            # Configuration settings
   │   ├── database.py          # Database connection
   │   ├── models/              # SQLAlchemy models
   │   │   ├── __init__.py
   │   │   └── user.py
   │   ├── schemas/             # Pydantic schemas
   │   │   ├── __init__.py
   │   │   └── user.py
   │   ├── api/                 # API routes
   │   │   ├── __init__.py
   │   │   └── v1/
   │   │       ├── __init__.py
   │   │       └── endpoints/
   │   ├── core/                # Core functionality
   │   │   ├── __init__.py
   │   │   ├── security.py
   │   │   └── deps.py
   │   └── utils/               # Utility functions
   │       ├── __init__.py
   │       └── helpers.py
   ├── tests/                   # Test files
   ├── alembic/                 # Database migrations
   ├── .env                     # Environment variables
   ├── requirements.txt         # Production dependencies
   └── requirements-dev.txt     # Development dependencies
   ```

**Validation Gates**:
- [ ] Virtual environment is created and activated
- [ ] All dependencies install without conflicts
- [ ] Project structure follows FastAPI conventions
- [ ] Python imports work correctly

### Phase 2: Core Application Setup
**Objective**: Set up the main FastAPI application and database

**Tasks**:
1. **Create FastAPI Application**
   ```python
   # app/main.py
   from fastapi import FastAPI
   from fastapi.middleware.cors import CORSMiddleware
   from app.api.v1.api import api_router
   from app.core.config import settings
   
   app = FastAPI(
       title=settings.PROJECT_NAME,
       openapi_url=f"{settings.API_V1_STR}/openapi.json"
   )
   
   # Set up CORS
   app.add_middleware(
       CORSMiddleware,
       allow_origins=["*"],  # Configure properly for production
       allow_credentials=True,
       allow_methods=["*"],
       allow_headers=["*"],
   )
   
   app.include_router(api_router, prefix=settings.API_V1_STR)
   
   @app.get("/")
   async def root():
       return {"message": "Welcome to FastAPI!"}
   ```

2. **Configuration Management**
   ```python
   # app/config.py
   from pydantic_settings import BaseSettings
   from typing import Optional
   
   class Settings(BaseSettings):
       PROJECT_NAME: str = "FastAPI Project"
       API_V1_STR: str = "/api/v1"
       SECRET_KEY: str = "your-secret-key-here"
       
       # Database
       DATABASE_URL: Optional[str] = "sqlite:///./app.db"
       
       # Security
       ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
       
       class Config:
           env_file = ".env"
   
   settings = Settings()
   ```

3. **Database Setup**
   ```python
   # app/database.py
   from sqlalchemy import create_engine
   from sqlalchemy.ext.declarative import declarative_base
   from sqlalchemy.orm import sessionmaker
   from app.core.config import settings
   
   engine = create_engine(settings.DATABASE_URL)
   SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
   
   Base = declarative_base()
   
   def get_db():
       db = SessionLocal()
       try:
           yield db
       finally:
           db.close()
   ```

**Validation Gates**:
- [ ] FastAPI server starts without errors
- [ ] Database connection is established
- [ ] API documentation is accessible at /docs
- [ ] Configuration is loading properly

### Phase 3: API Structure & Models
**Objective**: Create API endpoints and data models

**Tasks**:
1. **Create SQLAlchemy Models**
   ```python
   # app/models/user.py
   from sqlalchemy import Column, Integer, String, Boolean, DateTime
   from sqlalchemy.sql import func
   from app.database import Base
   
   class User(Base):
       __tablename__ = "users"
       
       id = Column(Integer, primary_key=True, index=True)
       email = Column(String, unique=True, index=True, nullable=False)
       hashed_password = Column(String, nullable=False)
       is_active = Column(Boolean, default=True)
       created_at = Column(DateTime(timezone=True), server_default=func.now())
       updated_at = Column(DateTime(timezone=True), onupdate=func.now())
   ```

2. **Create Pydantic Schemas**
   ```python
   # app/schemas/user.py
   from pydantic import BaseModel, EmailStr
   from datetime import datetime
   from typing import Optional
   
   class UserBase(BaseModel):
       email: EmailStr
   
   class UserCreate(UserBase):
       password: str
   
   class UserUpdate(UserBase):
       password: Optional[str] = None
   
   class UserInDBBase(UserBase):
       id: int
       is_active: bool
       created_at: datetime
       updated_at: Optional[datetime] = None
       
       class Config:
           from_attributes = True
   
   class User(UserInDBBase):
       pass
   
   class UserInDB(UserInDBBase):
       hashed_password: str
   ```

3. **Create API Endpoints**
   ```python
   # app/api/v1/endpoints/users.py
   from fastapi import APIRouter, Depends, HTTPException
   from sqlalchemy.orm import Session
   from typing import List
   from app import schemas, models
   from app.database import get_db
   
   router = APIRouter()
   
   @router.post("/", response_model=schemas.User)
   async def create_user(
       user: schemas.UserCreate,
       db: Session = Depends(get_db)
   ):
       # Implementation here
       pass
   
   @router.get("/", response_model=List[schemas.User])
   async def read_users(
       skip: int = 0,
       limit: int = 100,
       db: Session = Depends(get_db)
   ):
       # Implementation here
       pass
   
   @router.get("/{user_id}", response_model=schemas.User)
   async def read_user(user_id: int, db: Session = Depends(get_db)):
       # Implementation here
       pass
   ```

**Validation Gates**:
- [ ] Models are properly defined and mapped
- [ ] Schemas validate data correctly
- [ ] API endpoints respond correctly
- [ ] Database operations work as expected

### Phase 4: Security & Testing
**Objective**: Implement authentication and comprehensive testing

**Tasks**:
1. **Security Implementation**
   ```python
   # app/core/security.py
   from datetime import datetime, timedelta
   from jose import JWTError, jwt
   from passlib.context import CryptContext
   from app.core.config import settings
   
   pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
   
   def create_access_token(data: dict, expires_delta: timedelta = None):
       to_encode = data.copy()
       if expires_delta:
           expire = datetime.utcnow() + expires_delta
       else:
           expire = datetime.utcnow() + timedelta(minutes=15)
       to_encode.update({"exp": expire})
       encoded_jwt = jwt.encode(to_encode, settings.SECRET_KEY, algorithm="HS256")
       return encoded_jwt
   
   def verify_password(plain_password: str, hashed_password: str) -> bool:
       return pwd_context.verify(plain_password, hashed_password)
   
   def get_password_hash(password: str) -> str:
       return pwd_context.hash(password)
   ```

2. **Testing Setup**
   ```python
   # tests/conftest.py
   import pytest
   from fastapi.testclient import TestClient
   from sqlalchemy import create_engine
   from sqlalchemy.orm import sessionmaker
   from app.main import app
   from app.database import get_db, Base
   
   SQLALCHEMY_DATABASE_URL = "sqlite:///./test.db"
   
   engine = create_engine(SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False})
   TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
   
   @pytest.fixture
   def db():
       Base.metadata.create_all(bind=engine)
       db = TestingSessionLocal()
       try:
           yield db
       finally:
           db.close()
           Base.metadata.drop_all(bind=engine)
   
   @pytest.fixture
   def client(db):
       def override_get_db():
           try:
               yield db
           finally:
               db.close()
       
       app.dependency_overrides[get_db] = override_get_db
       with TestClient(app) as test_client:
           yield test_client
   ```

3. **Database Migrations**
   ```bash
   # Initialize Alembic
   alembic init alembic
   
   # Create first migration
   alembic revision --autogenerate -m "Initial migration"
   
   # Apply migration
   alembic upgrade head
   ```

**Validation Gates**:
- [ ] Authentication system works correctly
- [ ] Password hashing and verification work
- [ ] All tests pass
- [ ] Database migrations run successfully

## Common Patterns

### Dependency Injection Pattern
```python
# app/core/deps.py
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer
from jose import JWTError, jwt
from sqlalchemy.orm import Session
from app.database import get_db
from app.core.config import settings

security = HTTPBearer()

async def get_current_user(
    token: str = Depends(security),
    db: Session = Depends(get_db)
):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token.credentials, settings.SECRET_KEY, algorithms=["HS256"])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
    except JWTError:
        raise credentials_exception
    
    # Get user from database
    user = db.query(User).filter(User.email == username).first()
    if user is None:
        raise credentials_exception
    return user
```

### Repository Pattern
```python
# app/repositories/user.py
from sqlalchemy.orm import Session
from app.models.user import User
from app.schemas.user import UserCreate, UserUpdate
from app.core.security import get_password_hash
from typing import Optional, List

class UserRepository:
    def __init__(self, db: Session):
        self.db = db
    
    def get(self, user_id: int) -> Optional[User]:
        return self.db.query(User).filter(User.id == user_id).first()
    
    def get_by_email(self, email: str) -> Optional[User]:
        return self.db.query(User).filter(User.email == email).first()
    
    def get_multi(self, skip: int = 0, limit: int = 100) -> List[User]:
        return self.db.query(User).offset(skip).limit(limit).all()
    
    def create(self, user_create: UserCreate) -> User:
        hashed_password = get_password_hash(user_create.password)
        user = User(
            email=user_create.email,
            hashed_password=hashed_password
        )
        self.db.add(user)
        self.db.commit()
        self.db.refresh(user)
        return user
```

### Service Layer Pattern
```python
# app/services/user.py
from sqlalchemy.orm import Session
from app.repositories.user import UserRepository
from app.schemas.user import UserCreate, UserUpdate
from app.models.user import User
from fastapi import HTTPException, status

class UserService:
    def __init__(self, db: Session):
        self.repo = UserRepository(db)
    
    async def create_user(self, user_create: UserCreate) -> User:
        # Check if user already exists
        existing_user = self.repo.get_by_email(user_create.email)
        if existing_user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Email already registered"
            )
        
        return self.repo.create(user_create)
    
    async def get_user(self, user_id: int) -> User:
        user = self.repo.get(user_id)
        if not user:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="User not found"
            )
        return user
```

## Gotchas & Best Practices

### Performance Considerations
- **Async/Await**: Use async functions for I/O operations
- **Database Connections**: Use connection pooling for production
- **Query Optimization**: Use proper indexing and query optimization
- **Caching**: Implement Redis for caching frequently accessed data

### Security Best Practices
- **Environment Variables**: Never commit secrets to version control
- **Input Validation**: Use Pydantic for comprehensive input validation
- **SQL Injection**: Use SQLAlchemy ORM to prevent SQL injection
- **CORS**: Configure CORS properly for production environments

### Development Workflow
- **Type Hints**: Use type hints throughout the codebase
- **Error Handling**: Implement comprehensive error handling
- **Logging**: Use structured logging for better debugging
- **Testing**: Write comprehensive unit and integration tests

### Common Pitfalls
- **Blocking Operations**: Avoid blocking operations in async functions
- **Database Sessions**: Always close database sessions properly
- **Exception Handling**: Handle exceptions gracefully with proper HTTP status codes
- **API Versioning**: Plan for API versioning from the beginning

## Quality Gates

### Level 1: Syntax & Structure
- [ ] Python code follows PEP 8 standards
- [ ] Type hints are used throughout
- [ ] No syntax errors or import issues
- [ ] Project structure follows FastAPI conventions

### Level 2: Integration
- [ ] FastAPI server starts and responds
- [ ] Database connections work properly
- [ ] All API endpoints are accessible
- [ ] Authentication system functions correctly

### Level 3: Functional
- [ ] All CRUD operations work correctly
- [ ] Input validation is working
- [ ] Error handling is comprehensive
- [ ] API documentation is complete

### Level 4: Performance & Quality
- [ ] API response times meet targets
- [ ] Database queries are optimized
- [ ] Security measures are implemented
- [ ] Test coverage exceeds 90%

## Success Indicators
- [ ] FastAPI server runs without errors
- [ ] Database integration is working
- [ ] API endpoints respond correctly
- [ ] Authentication system is functional
- [ ] Tests are passing with good coverage
- [ ] Code quality tools are configured
- [ ] Documentation is auto-generated
- [ ] Production deployment is ready 