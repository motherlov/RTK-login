// LoginForm.js
import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { Button, TextField } from '@mui/material';
import { loginUser } from './authSlice';

const LoginForm = () => {
  const dispatch = useDispatch();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleEmailChange = (e) => setEmail(e.target.value);
  const handlePasswordChange = (e) => setPassword(e.target.value);

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('email', email);
    formData.append('password', password);

    dispatch(loginUser(formData));
  };

  return (
    <form onSubmit={handleSubmit}>
      <TextField
        label="Email"
        type="email"
        value={email}
        onChange={handleEmailChange}
        required
      />
      <TextField
        label="Password"
        type="password"
        value={password}
        onChange={handlePasswordChange}
        required
      />
      <Button type="submit">Login</Button>
    </form>
  );
};

export default LoginForm;





/////////////////////////////////////////////////////////////////////////////

// LoginForm.js
import React from 'react';
import { useForm } from 'react-hook-form';
import { useDispatch } from 'react-redux';
import { Button, TextField } from '@mui/material';
import { loginUser } from './authSlice';

const LoginForm = () => {
  const { register, handleSubmit, formState: { errors } } = useForm();
  const dispatch = useDispatch();

  const onSubmit = (data) => {
    const formData = new FormData();
    formData.append('email', data.email);
    formData.append('password', data.password);

    dispatch(loginUser(formData));
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <TextField label="Email" {...register('email', { required: true })} />
      {errors.email && <span>Email is required</span>}
      <TextField label="Password" type="password" {...register('password', { required: true })} />
      {errors.password && <span>Password is required</span>}
      <Button type="submit">Login</Button>
    </form>
  );
};

export default LoginForm;

