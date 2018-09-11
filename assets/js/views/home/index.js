import React                      from 'react';
import { connect }                from 'react-redux';
import classnames                 from 'classnames';
import moment                     from 'moment';
import PageClick                  from 'react-page-click';
import { setDocumentTitle }       from '../../utils';
import Timer                      from '../../components/timer';
import {
  fetchTimeEntries,
  continueTimeEntry,
  startTimer,
  displayDropdown,
  removeTimeEntries,
  selectSection,
  deselectSection
}                                 from '../../actions/time_entries';
import TimeEntryItem              from '../../components/time_entries/item';
import { timexDateToString }      from '../../utils';

class HomeIndexView extends React.Component {
  componentDidMount() {
    const { dispatch } = this.props;

    setDocumentTitle('Timer');
    dispatch(fetchTimeEntries());
  }

  _renderItems() {
    const { items, dispatch, channel, displayDropdownFor, timer, selectedItems } = this.props;

    const groups = this._buildItemGroups(items);

    return Object.keys(groups).map((date) => {
      const items = groups[date];
      const itemsIds = items.map((item) => item.id);
      const header = this._headerText(date);
      const showDropdown = displayDropdownFor === header;
      const selected = selectedItems[header] != undefined;

      const onContinueClick = (timeEntry) => {
        if (timer.started) this.refs.timer.stop();

        if (header === 'Today') {
          const restartedAt = moment().toISOString();
          const item = { ...timeEntry, restarted_at: restartedAt };

          channel.push('time_entry:restart', item)
          .receive('ok', (data) => {
            dispatch(continueTimeEntry(data));
          });

        } else {
          const newTimeEntry = {
            started_at: moment.utc().toISOString(),
            description: timeEntry.description,
            workspace_id: null,
          };

          channel.push('time_entry:start', newTimeEntry)
          .receive('ok', (data) => {
            dispatch(startTimer(data));
          });
        }
      };

      const onToggleDropdownClick = () => {
        dispatch(displayDropdown(header));
      };

      const onCheckboxChange = (e) => {
        const checked = e.target.checked;

        checked ? dispatch(selectSection(header, itemsIds)) : dispatch(deselectSection(header, itemsIds));
      };

      return (
        <section key={date} className="time-entries">
          <header>
            <div className="checkbox-container">
              <input checked={selected} id={date} type="checkbox" onChange={onCheckboxChange}/>
              <label htmlFor={date}></label>
              <i className="fa fa-caret-down" onClick={onToggleDropdownClick}/>
              {::this._renderDropdown(header, showDropdown)}
            </div>
            <div className="description-container">
              <span className="title">{header}</span>
              <small>{::this._renderTotalTime(items)}</small>
            </div>
          </header>
          <ul>
            {::this._itemNodes(header, items, onContinueClick)}
          </ul>
        </section>
      );
    });
  }

  _headerText(dateKey) {
    const date = moment(dateKey, 'YYYY-MM-DD');

    switch (moment().diff(date, 'days')) {
      case 0:
        return 'Today';
      case 1:
        return 'Yesterday';
      default:
        return date.format('ddd, DD MMM');
    }
  }

  _renderDropdown(section, showDropdown) {
    const { dispatch, channel, selectedItems } = this.props;

    if (!showDropdown) return false;

    const onDeleteClick = (e) => {
      e.preventDefault();

      if (confirm('Are you sure you want to delete this entry?')) {
        channel.push('time_entry:delete', { id: selectedItems[section] })
        .receive('ok', (data) => {
          dispatch(removeTimeEntries(section, data.ids));
        });

      }
    };

    return (
      <PageClick onClick={::this._handlePageClick}>
        <div className="dropdown">
          <ul>
            <li>
              <a href="#" onClick={onDeleteClick}>Delete</a>
            </li>
          </ul>
        </div>
      </PageClick>
    );
  }

  _itemNodes(section, items, continueCallback) {
    const { displayDropdownFor, dispatch, channel, selectedItems, editItem } = this.props;

    return items.map((item) => {
      const displayDropdown = item.id === displayDropdownFor;
      const selected = selectedItems[section] && selectedItems[section].indexOf(item.id) != -1;
      const inEditMode = item.id === editItem;

      return (
        <TimeEntryItem
          key={item.id}
          continueClick={continueCallback}
          displayDropdown={displayDropdown}
          dispatch={dispatch}
          channel={channel}
          section={section}
          selected={selected}
          inEditMode={inEditMode}
          {...item} />
      );
    });
  }

  _buildItemGroups(items) {
    const groups = {};

    items.forEach((item) => {
      const key = timexDateToString(item.started_at);

      groups[key] = groups[key] || [];
      groups[key].push(item);
    });

    return groups;
  }

  _renderTotalTime(items) {
    const { duration } = items.reduce((prev, curr) => {
      return { duration: prev.duration + curr.duration };}, { duration: 0 }
    );
    const momentDuration = moment.duration(duration * 1000);

    const hours = momentDuration.hours()
    const minutes = momentDuration.minutes()
    const seconds = momentDuration.seconds()

    return `${hours} h ${minutes} min ${seconds} secs`;
  }

  _handlePageClick() {
    const { dispatch } = this.props;

    dispatch(displayDropdown(0));
  }

  render() {
    const { timer, channel, dispatch } = this.props;

    return (
      <div id="home_index" className="view-container">
        <div className="container">
          <Timer
            ref="timer"
            channel={channel}
            dispatch={dispatch}
            {...timer} />
          {::this._renderItems()}
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state) => (
  { ...state.timeEntries, channel: state.session.channel, timer: state.timer }
);

export default connect(mapStateToProps)(HomeIndexView);
