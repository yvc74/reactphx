import React from 'react';
import { connect }          from 'react-redux';
import { Link }             from 'react-router-dom';

import {
  setDocumentTitle,
  renderErrorsFor,
  creditsText }             from '../../utils';
import Actions              from '../../actions/registrations';

class RegistrationsNewView extends React.Component {
  componentDidMount() {
    setDocumentTitle('Sign up');
  }

  _handleSubmit(e) {
    e.preventDefault();

    const { dispatch } = this.props;

    const data = {
      username: this.refs.username.value,
      password: this.refs.password.value,
    };

    dispatch(Actions.signUp(data));
  }

  render() {
    const { errors } = this.props;

    return (
      <div id="registrations_new_view" className="view-container">
        <div className="form-wrapper">
          <div className="inner">
            <header>
              <div className="logo" />
              {creditsText()}
            </header>
            <form id="sign_up_form" onSubmit={this._handleSubmit}>
              <div className="field">
                <input ref="username" id="user_username" type="text" placeholder="Username" required={true} />
                {renderErrorsFor(errors, 'username')}
              </div>
              <div className="field">
                <input ref="password" id="user_password" type="password" placeholder="Password" required={true} />
                {renderErrorsFor(errors, 'password')}
              </div>
              <button type="submit">Sign up</button>
            </form>
          </div>
          <Link to="/sign_in">Sign in</Link>
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  errors: state.registration.errors,
});

export default connect(mapStateToProps)(RegistrationsNewView);
