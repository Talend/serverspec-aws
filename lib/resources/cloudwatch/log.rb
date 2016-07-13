# encoding: utf-8

module Serverspec
  module Type
    module AWS
      # The CloudWatch module contains the CloudWatch API resources
      module CloudWatch
        # The Alarm class exposes the CloudWatch::Alarm resources
        class Log < Base
          # AWS SDK for Ruby v2 Aws::CloudWatch::Client wrapper for initializing
          # an Alarm resource
          # @param log_group_name [String] The name of the Alarm
          # @param instance [Class] Aws::CloudWatch::Client instance
          # @raise [RuntimeError] if log_group_name.nil?
          # @raise [RuntimeError] if alarms.length == 0
          # @raise [RuntimeError] if alarms.length > 1
          def initialize(log_group_name, instance = nil)
            check_init_arg 'log_group_name', 'CloudWatch::Alarm', log_group_name
            @log_group_name = log_group_name
            @aws = instance.nil? ? Aws::CloudWatchLogs::Client.new : instance
            get_log_stream log_group_name
          end

          # Returns the String representation of CloudWatch::Alarmm
          # @return [String]
          def to_s
            "CloudWatch Alarm: #{@log_group_name}"
          end

          # Checks if the logstream is present
          def present?
            @log_streams.length >= 1
          end

          def stale?
            @log_streams.each do |ls|



            end
          end

          # # Indicates whether actions should be executed during any changes to
          # # the Alarm's state
          # def actions_enabled?
          #   @log_stream.actions_enabled
          # end
          #
          # # The description for the Alarm
          # # @return [String]
          # def alarm_description
          #   @log_stream.alarm_description
          # end
          #
          # # The list of actions to execute when this Alarm transitions into an
          # # OK state from any other state
          # # @return [Array(String)]
          # def ok_actions
          #   @log_stream.ok_actions
          # end
          #
          # # The list of actions to execute when this Alarm transitions into an
          # # ALARM state from any other state
          # # @return [Array(String)]
          # def alarm_actions
          #   @log_stream.alarm_actions
          # end
          #
          # # The list of actions to execute when this Alarm transitions into an
          # # INSUFFICIENT_DATA state from any other state
          # # @return [Array(String)]
          # def insufficient_data_actions
          #   @log_stream.insufficient_data_actions
          # end
          #
          # # The name of the Alarm's metric
          # # @return [String]
          # def metric_name
          #   @log_stream.metric_name
          # end
          #
          # # The namespace of Alarm's associated metric
          # # @return [String]
          # def namespace
          #   @log_stream.namespace
          # end
          #
          # # The statistic to apply to the Alarm's associated metric
          # # @return [String]
          # def statistic
          #   @log_stream.statistic
          # end
          #
          # # The list of dimensions associated with the Alarm's associated metric
          # # @return [Array(Hash{Symbol => String})]
          # # @example alarm.dimensions #=>
          # #  [
          # #    {
          # #      name: 'The name of the dimension',
          # #      value: 'The value representing the dimension measurement'
          # #    }
          # #  ]
          # def dimensions
          #   @log_stream.dimensions
          # end
          #
          # # The period in seconds over which the statistic is applied
          # # @return [Integer]
          # def period
          #   @log_stream.period
          # end
          #
          # # The number of periods over which data is compared to the specified
          # # threshold
          # # @return [Integer]
          # def evaluation_periods
          #   @log_stream.evaluation_periods
          # end
          #
          # # The value against which the specified statistic is compared
          # # @return [Number]
          # def threshold
          #   @log_stream.threshold
          # end
          #
          # # The arithmetic operation to use when comparing the specified
          # # Statistic and Threshold
          # # @return [String]
          # def comparison_operator
          #   @log_stream.comparison_operator
          # end

          private

          # @private
          def get_log_stream(name)
            ls = @aws.describe_log_streams(log_group_name: name).log_streams
            check_length 'log_stream', ls
            @log_streams = ls
          end
        end
      end
    end
  end
end
