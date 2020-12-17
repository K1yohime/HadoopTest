package My.ReduceScore;

import java.io.IOException;
import java.text.DecimalFormat;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class Reducescore {

	public static class Map extends Mapper<Object, Text, Text, DoubleWritable> {

		private static Text newKey = new Text();

		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException {

			String line = value.toString();
			String arr[] = line.split(",");
			String line1 = arr[0];

			String arr1[] = line1.split("-");
			newKey.set(arr1[0]);

			double score = Double.parseDouble(arr[1]);
			context.write(newKey, new DoubleWritable(score));
		}
	}

	public static class Reduce extends
			Reducer<Text, DoubleWritable, Text, DoubleWritable> {

		public void reduce(Text key, Iterable<DoubleWritable> values,
				Context context) throws IOException, InterruptedException {

			double num = 0;
			int count = 0;
			for (DoubleWritable val : values) {
				num += val.get();
				count++;
			}
			double avg = num / count;

			DecimalFormat df = new DecimalFormat("0.0");
			String result = df.format(avg);

			context.write(key, new DoubleWritable(Double.parseDouble(result)));
		}
	}

	public static void main(String[] args) throws IOException,
			ClassNotFoundException, InterruptedException {
		Configuration conf = new Configuration();

		Job job = new Job(conf, "ReduceAndScore");
		job.setJarByClass(Reducescore.class);

		job.setMapperClass(Map.class);
		job.setReducerClass(Reduce.class);

		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(DoubleWritable.class);

		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);

		Path in = new Path("hdfs://localhost:9000/myreduce/in/rs_result.csv");
		Path out = new Path("hdfs://localhost:9000/myreduce/out16");
		FileInputFormat.addInputPath(job, in);
		FileOutputFormat.setOutputPath(job, out);
		System.exit(job.waitForCompletion(true) ? 0 : 1);

	}
}